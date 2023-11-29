// Copyright 2023 The Dawn & Tint Authors
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// 1. Redistributions of source code must retain the above copyright notice, this
//    list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright notice,
//    this list of conditions and the following disclaimer in the documentation
//    and/or other materials provided with the distribution.
//
// 3. Neither the name of the copyright holder nor the names of its
//    contributors may be used to endorse or promote products derived from
//    this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

////////////////////////////////////////////////////////////////////////////////
// File generated by 'tools/src/cmd/gen' using the template:
//   src/tint/lang/msl/intrinsic/data.cc.tmpl
//
// To regenerate run: './tools/run gen'
//
//                       Do not modify this file directly
////////////////////////////////////////////////////////////////////////////////

#include <limits>
#include <string>

#include "src/tint/lang/core/intrinsic/type_matchers.h"
#include "src/tint/lang/msl/intrinsic/dialect.h"
#include "src/tint/utils/text/string_stream.h"

namespace tint::msl::intrinsic {

using namespace tint::core::intrinsic;  // NOLINT(build/namespaces)

namespace {

using ConstEvalFunctionIndex = tint::core::intrinsic::ConstEvalFunctionIndex;
using IntrinsicInfo = tint::core::intrinsic::IntrinsicInfo;
using MatchState = tint::core::intrinsic::MatchState;
using Number = tint::core::intrinsic::Number;
using NumberMatcher = tint::core::intrinsic::NumberMatcher;
using NumberMatcherIndex = tint::core::intrinsic::NumberMatcherIndex;
using NumberMatcherIndicesIndex = tint::core::intrinsic::NumberMatcherIndicesIndex;
using OverloadFlag = tint::core::intrinsic::OverloadFlag;
using OverloadFlags = tint::core::intrinsic::OverloadFlags;
using OverloadIndex = tint::core::intrinsic::OverloadIndex;
using OverloadInfo = tint::core::intrinsic::OverloadInfo;
using ParameterIndex = tint::core::intrinsic::ParameterIndex;
using ParameterInfo = tint::core::intrinsic::ParameterInfo;
using StringStream = tint::StringStream;
using TemplateNumberIndex = tint::core::intrinsic::TemplateNumberIndex;
using TemplateNumberInfo = tint::core::intrinsic::TemplateNumberInfo;
using TemplateTypeIndex = tint::core::intrinsic::TemplateTypeIndex;
using TemplateTypeInfo = tint::core::intrinsic::TemplateTypeInfo;
using Type = tint::core::type::Type;
using TypeMatcher = tint::core::intrinsic::TypeMatcher;
using TypeMatcherIndex = tint::core::intrinsic::TypeMatcherIndex;
using TypeMatcherIndicesIndex = tint::core::intrinsic::TypeMatcherIndicesIndex;

template <size_t N>
using TemplateNumberMatcher = tint::core::intrinsic::TemplateNumberMatcher<N>;

template <size_t N>
using TemplateTypeMatcher = tint::core::intrinsic::TemplateTypeMatcher<N>;

// clang-format off

/// TypeMatcher for 'type u32'
constexpr TypeMatcher kU32Matcher {
/* match */ [](MatchState& state, const Type* ty) -> const Type* {
    if (!MatchU32(state, ty)) {
      return nullptr;
    }
    return BuildU32(state, ty);
  },
/* string */ [](MatchState*) -> std::string {
    return "u32";
  }
};


/// Type and number matchers

/// The template types, types, and type matchers
constexpr TypeMatcher kTypeMatchers[] = {
  /* [0] */ kU32Matcher,
};

constexpr TypeMatcherIndex kTypeMatcherIndices[] = {
  /* [0] */ TypeMatcherIndex(0),
};

static_assert(TypeMatcherIndex::CanIndex(kTypeMatcherIndices),
              "TypeMatcherIndex is not large enough to index kTypeMatcherIndices");

constexpr ParameterInfo kParameters[] = {
  {
    /* [0] */
    /* usage */ core::ParameterUsage::kNone,
    /* type_matcher_indices */ TypeMatcherIndicesIndex(0),
    /* number_matcher_indices */ NumberMatcherIndicesIndex(/* invalid */),
  },
};

static_assert(ParameterIndex::CanIndex(kParameters),
              "ParameterIndex is not large enough to index kParameters");

constexpr OverloadInfo kOverloads[] = {
  {
    /* [0] */
    /* flags */ OverloadFlags(OverloadFlag::kIsBuiltin, OverloadFlag::kSupportsComputePipeline),
    /* num_parameters */ 1,
    /* num_template_types */ 0,
    /* num_template_numbers */ 0,
    /* template_types */ TemplateTypeIndex(/* invalid */),
    /* template_numbers */ TemplateNumberIndex(/* invalid */),
    /* parameters */ ParameterIndex(0),
    /* return_type_matcher_indices */ TypeMatcherIndicesIndex(/* invalid */),
    /* return_number_matcher_indices */ NumberMatcherIndicesIndex(/* invalid */),
    /* const_eval_fn */ ConstEvalFunctionIndex(/* invalid */),
  },
};

static_assert(OverloadIndex::CanIndex(kOverloads),
              "OverloadIndex is not large enough to index kOverloads");

constexpr IntrinsicInfo kBuiltins[] = {
  {
    /* [0] */
    /* fn threadgroup_barrier(u32) */
    /* num overloads */ 1,
    /* overloads */ OverloadIndex(0),
  },
};

// clang-format on

}  // anonymous namespace

const core::intrinsic::TableData Dialect::kData{
    /* template_types */ Empty,
    /* template_numbers */ Empty,
    /* type_matcher_indices */ kTypeMatcherIndices,
    /* number_matcher_indices */ Empty,
    /* type_matchers */ kTypeMatchers,
    /* number_matchers */ Empty,
    /* parameters */ kParameters,
    /* overloads */ kOverloads,
    /* const_eval_functions */ Empty,
    /* ctor_conv */ Empty,
    /* builtins */ kBuiltins,
    /* binary '+' */ tint::core::intrinsic::kNoOverloads,
    /* binary '-' */ tint::core::intrinsic::kNoOverloads,
    /* binary '*' */ tint::core::intrinsic::kNoOverloads,
    /* binary '/' */ tint::core::intrinsic::kNoOverloads,
    /* binary '%' */ tint::core::intrinsic::kNoOverloads,
    /* binary '^' */ tint::core::intrinsic::kNoOverloads,
    /* binary '&' */ tint::core::intrinsic::kNoOverloads,
    /* binary '|' */ tint::core::intrinsic::kNoOverloads,
    /* binary '&&' */ tint::core::intrinsic::kNoOverloads,
    /* binary '||' */ tint::core::intrinsic::kNoOverloads,
    /* binary '==' */ tint::core::intrinsic::kNoOverloads,
    /* binary '!=' */ tint::core::intrinsic::kNoOverloads,
    /* binary '<' */ tint::core::intrinsic::kNoOverloads,
    /* binary '>' */ tint::core::intrinsic::kNoOverloads,
    /* binary '<=' */ tint::core::intrinsic::kNoOverloads,
    /* binary '>=' */ tint::core::intrinsic::kNoOverloads,
    /* binary '<<' */ tint::core::intrinsic::kNoOverloads,
    /* binary '>>' */ tint::core::intrinsic::kNoOverloads,
    /* unary '!' */ tint::core::intrinsic::kNoOverloads,
    /* unary '~' */ tint::core::intrinsic::kNoOverloads,
    /* unary '-' */ tint::core::intrinsic::kNoOverloads,
};

}  // namespace tint::msl::intrinsic
