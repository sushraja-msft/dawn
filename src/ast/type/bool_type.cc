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

#include "src/ast/type/bool_type.h"

#include "src/ast/clone_context.h"
#include "src/ast/module.h"

TINT_INSTANTIATE_CLASS_ID(tint::ast::type::Bool);

namespace tint {
namespace ast {
namespace type {

Bool::Bool() = default;

Bool::Bool(Bool&&) = default;

Bool::~Bool() = default;

std::string Bool::type_name() const {
  return "__bool";
}

Bool* Bool::Clone(CloneContext* ctx) const {
  return ctx->mod->create<Bool>();
}

}  // namespace type
}  // namespace ast
}  // namespace tint
