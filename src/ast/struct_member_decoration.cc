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

#include "src/ast/struct_member_decoration.h"

#include <assert.h>

#include "src/ast/struct_member_offset_decoration.h"

TINT_INSTANTIATE_CLASS_ID(tint::ast::StructMemberDecoration);

namespace tint {
namespace ast {

constexpr const DecorationKind StructMemberDecoration::Kind;

StructMemberDecoration::StructMemberDecoration(const Source& source)
    : Base(source) {}

StructMemberDecoration::~StructMemberDecoration() = default;

DecorationKind StructMemberDecoration::GetKind() const {
  return Kind;
}

}  // namespace ast
}  // namespace tint
