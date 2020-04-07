// Copyright 2020 The Tint Authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "src/type_determiner.h"

#include <memory>

#include "src/ast/array_accessor_expression.h"
#include "src/ast/as_expression.h"
#include "src/ast/assignment_statement.h"
#include "src/ast/break_statement.h"
#include "src/ast/call_expression.h"
#include "src/ast/case_statement.h"
#include "src/ast/continue_statement.h"
#include "src/ast/else_statement.h"
#include "src/ast/identifier_expression.h"
#include "src/ast/if_statement.h"
#include "src/ast/loop_statement.h"
#include "src/ast/regardless_statement.h"
#include "src/ast/return_statement.h"
#include "src/ast/scalar_constructor_expression.h"
#include "src/ast/switch_statement.h"
#include "src/ast/type/array_type.h"
#include "src/ast/type/matrix_type.h"
#include "src/ast/type/vector_type.h"
#include "src/ast/type_constructor_expression.h"
#include "src/ast/unless_statement.h"
#include "src/ast/variable_decl_statement.h"

namespace tint {

TypeDeterminer::TypeDeterminer(Context* ctx) : ctx_(*ctx) {}

TypeDeterminer::~TypeDeterminer() = default;

bool TypeDeterminer::Determine(ast::Module* mod) {
  for (const auto& var : mod->global_variables()) {
    variable_stack_.set_global(var->name(), var.get());
  }

  for (const auto& func : mod->functions()) {
    name_to_function_[func->name()] = func.get();
  }

  if (!DetermineFunctions(mod->functions())) {
    return false;
  }
  return true;
}

bool TypeDeterminer::DetermineFunctions(const ast::FunctionList& funcs) {
  for (const auto& func : funcs) {
    if (!DetermineFunction(func.get())) {
      return false;
    }
  }
  return true;
}

bool TypeDeterminer::DetermineFunction(ast::Function* func) {
  variable_stack_.push_scope();
  if (!DetermineResultType(func->body())) {
    return false;
  }
  variable_stack_.pop_scope();

  return true;
}

bool TypeDeterminer::DetermineResultType(const ast::StatementList& stmts) {
  for (const auto& stmt : stmts) {
    if (!DetermineResultType(stmt.get())) {
      return false;
    }
  }
  return true;
}

bool TypeDeterminer::DetermineResultType(ast::Statement* stmt) {
  if (stmt->IsAssign()) {
    auto a = stmt->AsAssign();
    return DetermineResultType(a->lhs()) && DetermineResultType(a->rhs());
  }
  if (stmt->IsBreak()) {
    auto b = stmt->AsBreak();
    return DetermineResultType(b->conditional());
  }
  if (stmt->IsCase()) {
    auto c = stmt->AsCase();
    return DetermineResultType(c->body());
  }
  if (stmt->IsContinue()) {
    auto c = stmt->AsContinue();
    return DetermineResultType(c->conditional());
  }
  if (stmt->IsElse()) {
    auto e = stmt->AsElse();
    return DetermineResultType(e->condition()) &&
           DetermineResultType(e->body());
  }
  if (stmt->IsFallthrough()) {
    return true;
  }
  if (stmt->IsIf()) {
    auto i = stmt->AsIf();
    if (!DetermineResultType(i->condition()) ||
        !DetermineResultType(i->body())) {
      return false;
    }

    for (const auto& else_stmt : i->else_statements()) {
      if (!DetermineResultType(else_stmt.get())) {
        return false;
      }
    }
    return true;
  }
  if (stmt->IsKill()) {
    return true;
  }
  if (stmt->IsLoop()) {
    auto l = stmt->AsLoop();
    return DetermineResultType(l->body()) &&
           DetermineResultType(l->continuing());
  }
  if (stmt->IsNop()) {
    return true;
  }
  if (stmt->IsRegardless()) {
    auto r = stmt->AsRegardless();
    return DetermineResultType(r->condition()) &&
           DetermineResultType(r->body());
  }
  if (stmt->IsReturn()) {
    auto r = stmt->AsReturn();
    return DetermineResultType(r->value());
  }
  if (stmt->IsSwitch()) {
    auto s = stmt->AsSwitch();
    if (!DetermineResultType(s->condition())) {
      return false;
    }
    for (const auto& case_stmt : s->body()) {
      if (!DetermineResultType(case_stmt.get())) {
        return false;
      }
    }
    return true;
  }
  if (stmt->IsUnless()) {
    auto u = stmt->AsUnless();
    return DetermineResultType(u->condition()) &&
           DetermineResultType(u->body());
  }
  if (stmt->IsVariableDecl()) {
    auto v = stmt->AsVariableDecl();
    variable_stack_.set(v->variable()->name(), v->variable());
    return DetermineResultType(v->variable()->constructor());
  }

  error_ = "unknown statement type for type determination";
  return false;
}

bool TypeDeterminer::DetermineResultType(const ast::ExpressionList& exprs) {
  for (const auto& expr : exprs) {
    if (!DetermineResultType(expr.get())) {
      return false;
    }
  }
  return true;
}

bool TypeDeterminer::DetermineResultType(ast::Expression* expr) {
  // This is blindly called above, so in some cases the expression won't exist.
  if (!expr) {
    return true;
  }

  if (expr->IsArrayAccessor()) {
    return DetermineArrayAccessor(expr->AsArrayAccessor());
  }
  if (expr->IsAs()) {
    return DetermineAs(expr->AsAs());
  }
  if (expr->IsCall()) {
    return DetermineCall(expr->AsCall());
  }
  if (expr->IsConstructor()) {
    return DetermineConstructor(expr->AsConstructor());
  }
  if (expr->IsIdentifier()) {
    return DetermineIdentifier(expr->AsIdentifier());
  }

  error_ = "unknown expression for type determination";
  return false;
}

bool TypeDeterminer::DetermineArrayAccessor(
    ast::ArrayAccessorExpression* expr) {
  if (!DetermineResultType(expr->array())) {
    return false;
  }
  auto parent_type = expr->array()->result_type();
  if (parent_type->IsArray()) {
    expr->set_result_type(parent_type->AsArray()->type());
  } else if (parent_type->IsVector()) {
    expr->set_result_type(parent_type->AsVector()->type());
  } else if (parent_type->IsMatrix()) {
    auto m = parent_type->AsMatrix();
    expr->set_result_type(ctx_.type_mgr().Get(
        std::make_unique<ast::type::VectorType>(m->type(), m->rows())));
  } else {
    error_ = "invalid parent type in array accessor";
    return false;
  }
  return true;
}

bool TypeDeterminer::DetermineAs(ast::AsExpression* expr) {
  expr->set_result_type(expr->type());
  return true;
}

bool TypeDeterminer::DetermineCall(ast::CallExpression* expr) {
  if (!DetermineResultType(expr->func())) {
    return false;
  }
  if (!DetermineResultType(expr->params())) {
    return false;
  }
  expr->set_result_type(expr->func()->result_type());
  return true;
}

bool TypeDeterminer::DetermineConstructor(ast::ConstructorExpression* expr) {
  if (expr->IsTypeConstructor()) {
    expr->set_result_type(expr->AsTypeConstructor()->type());
  } else {
    expr->set_result_type(expr->AsScalarConstructor()->literal()->type());
  }
  return true;
}

bool TypeDeterminer::DetermineIdentifier(ast::IdentifierExpression* expr) {
  if (expr->name().size() > 1) {
    // TODO(dsinclair): Handle imports
    error_ = "imports not handled in type determination";
    return false;
  }

  auto name = expr->name()[0];
  ast::Variable* var;
  if (variable_stack_.get(name, &var)) {
    expr->set_result_type(var->type());
    return true;
  }

  auto iter = name_to_function_.find(name);
  if (iter != name_to_function_.end()) {
    expr->set_result_type(iter->second->return_type());
    return true;
  }

  error_ = "unknown identifier for type determination";
  return false;
}

}  // namespace tint
