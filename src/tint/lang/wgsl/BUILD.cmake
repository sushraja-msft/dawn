# Copyright 2023 The Tint Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

################################################################################
# File generated by 'tools/src/cmd/gen' using the template:
#   tools/src/cmd/gen/build/BUILD.cmake.tmpl
#
# To regenerate run: './tools/run gen'
#
#                       Do not modify this file directly
################################################################################

include(lang/wgsl/ast/BUILD.cmake)
include(lang/wgsl/helpers/BUILD.cmake)
include(lang/wgsl/inspector/BUILD.cmake)
include(lang/wgsl/intrinsic/BUILD.cmake)
include(lang/wgsl/ir/BUILD.cmake)
include(lang/wgsl/program/BUILD.cmake)
include(lang/wgsl/reader/BUILD.cmake)
include(lang/wgsl/resolver/BUILD.cmake)
include(lang/wgsl/sem/BUILD.cmake)
include(lang/wgsl/writer/BUILD.cmake)

################################################################################
# Target:    tint_lang_wgsl
# Kind:      lib
################################################################################
tint_add_target(tint_lang_wgsl lib
  lang/wgsl/builtin_fn.cc
  lang/wgsl/builtin_fn.h
  lang/wgsl/diagnostic_rule.cc
  lang/wgsl/diagnostic_rule.h
  lang/wgsl/diagnostic_severity.cc
  lang/wgsl/diagnostic_severity.h
  lang/wgsl/extension.cc
  lang/wgsl/extension.h
)

tint_target_add_dependencies(tint_lang_wgsl lib
  tint_utils_containers
  tint_utils_diagnostic
  tint_utils_ice
  tint_utils_macros
  tint_utils_math
  tint_utils_memory
  tint_utils_rtti
  tint_utils_text
  tint_utils_traits
)

################################################################################
# Target:    tint_lang_wgsl_test
# Kind:      test
################################################################################
tint_add_target(tint_lang_wgsl_test test
  lang/wgsl/diagnostic_rule_test.cc
  lang/wgsl/diagnostic_severity_test.cc
  lang/wgsl/extension_test.cc
  lang/wgsl/wgsl_test.cc
)

tint_target_add_dependencies(tint_lang_wgsl_test test
  tint_api_common
  tint_lang_core
  tint_lang_core_constant
  tint_lang_core_ir
  tint_lang_core_type
  tint_lang_wgsl
  tint_lang_wgsl_ast
  tint_lang_wgsl_helpers_test
  tint_lang_wgsl_program
  tint_lang_wgsl_reader
  tint_lang_wgsl_reader_lower
  tint_lang_wgsl_reader_program_to_ir
  tint_lang_wgsl_resolver
  tint_lang_wgsl_sem
  tint_lang_wgsl_writer
  tint_lang_wgsl_writer_ir_to_program
  tint_utils_containers
  tint_utils_diagnostic
  tint_utils_ice
  tint_utils_id
  tint_utils_macros
  tint_utils_math
  tint_utils_memory
  tint_utils_reflection
  tint_utils_result
  tint_utils_rtti
  tint_utils_symbol
  tint_utils_text
  tint_utils_traits
)

tint_target_add_external_dependencies(tint_lang_wgsl_test test
  "gtest"
)

if(TINT_BUILD_WGSL_READER AND TINT_BUILD_WGSL_WRITER)
  tint_target_add_sources(tint_lang_wgsl_test test
    "lang/wgsl/ir_roundtrip_test.cc"
  )
endif(TINT_BUILD_WGSL_READER AND TINT_BUILD_WGSL_WRITER)

################################################################################
# Target:    tint_lang_wgsl_bench
# Kind:      bench
################################################################################
tint_add_target(tint_lang_wgsl_bench bench
  lang/wgsl/diagnostic_rule_bench.cc
  lang/wgsl/diagnostic_severity_bench.cc
  lang/wgsl/extension_bench.cc
)

tint_target_add_dependencies(tint_lang_wgsl_bench bench
  tint_lang_wgsl
  tint_utils_containers
  tint_utils_diagnostic
  tint_utils_ice
  tint_utils_macros
  tint_utils_math
  tint_utils_memory
  tint_utils_rtti
  tint_utils_text
  tint_utils_traits
)

tint_target_add_external_dependencies(tint_lang_wgsl_bench bench
  "google-benchmark"
)
