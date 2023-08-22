// Copyright 2022 The Tint Authors.
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
//   test/tint/builtins/gen/gen.wgsl.tmpl
//
// To regenerate run: './tools/run gen'
//
//                       Do not modify this file directly
////////////////////////////////////////////////////////////////////////////////


// fn ldexp(vec<2, fa>, vec<2, ia>) -> vec<2, fa>
fn ldexp_2c6370() {
  const arg_0 = vec2(1.);
  const arg_1 = vec2(1);
  var res = ldexp(arg_0, arg_1);
}
@vertex
fn vertex_main() -> @builtin(position) vec4<f32> {
  ldexp_2c6370();
  return vec4<f32>();
}

@fragment
fn fragment_main() {
  ldexp_2c6370();
}

@compute @workgroup_size(1)
fn compute_main() {
  ldexp_2c6370();
}
