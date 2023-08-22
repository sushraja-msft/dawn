// Copyright 2023 The Tint Authors.
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

////////////////////////////////////////////////////////////////////////////////
// File generated by 'tools/src/cmd/gen' using the template:
//   src/tint/lang/core/attribute.cc.tmpl
//
// To regenerate run: './tools/run gen'
//
//                       Do not modify this file directly
////////////////////////////////////////////////////////////////////////////////

#include "src/tint/lang/core/attribute.h"

namespace tint::core {

/// ParseAttribute parses a Attribute from a string.
/// @param str the string to parse
/// @returns the parsed enum, or Attribute::kUndefined if the string could not be parsed.
Attribute ParseAttribute(std::string_view str) {
    if (str == "align") {
        return Attribute::kAlign;
    }
    if (str == "binding") {
        return Attribute::kBinding;
    }
    if (str == "builtin") {
        return Attribute::kBuiltin;
    }
    if (str == "compute") {
        return Attribute::kCompute;
    }
    if (str == "diagnostic") {
        return Attribute::kDiagnostic;
    }
    if (str == "fragment") {
        return Attribute::kFragment;
    }
    if (str == "group") {
        return Attribute::kGroup;
    }
    if (str == "id") {
        return Attribute::kId;
    }
    if (str == "index") {
        return Attribute::kIndex;
    }
    if (str == "interpolate") {
        return Attribute::kInterpolate;
    }
    if (str == "invariant") {
        return Attribute::kInvariant;
    }
    if (str == "location") {
        return Attribute::kLocation;
    }
    if (str == "must_use") {
        return Attribute::kMustUse;
    }
    if (str == "size") {
        return Attribute::kSize;
    }
    if (str == "vertex") {
        return Attribute::kVertex;
    }
    if (str == "workgroup_size") {
        return Attribute::kWorkgroupSize;
    }
    return Attribute::kUndefined;
}

std::string_view ToString(Attribute value) {
    switch (value) {
        case Attribute::kUndefined:
            return "undefined";
        case Attribute::kAlign:
            return "align";
        case Attribute::kBinding:
            return "binding";
        case Attribute::kBuiltin:
            return "builtin";
        case Attribute::kCompute:
            return "compute";
        case Attribute::kDiagnostic:
            return "diagnostic";
        case Attribute::kFragment:
            return "fragment";
        case Attribute::kGroup:
            return "group";
        case Attribute::kId:
            return "id";
        case Attribute::kIndex:
            return "index";
        case Attribute::kInterpolate:
            return "interpolate";
        case Attribute::kInvariant:
            return "invariant";
        case Attribute::kLocation:
            return "location";
        case Attribute::kMustUse:
            return "must_use";
        case Attribute::kSize:
            return "size";
        case Attribute::kVertex:
            return "vertex";
        case Attribute::kWorkgroupSize:
            return "workgroup_size";
    }
    return "<unknown>";
}

}  // namespace tint::core
