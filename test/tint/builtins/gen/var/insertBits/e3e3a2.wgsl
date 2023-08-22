// Copyright 2021 The Tint Authors.
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


// fn insertBits(u32, u32, u32, u32) -> u32
fn insertBits_e3e3a2() {
  var arg_0 = 1u;
  var arg_1 = 1u;
  var arg_2 = 1u;
  var arg_3 = 1u;
  var res: u32 = insertBits(arg_0, arg_1, arg_2, arg_3);
  prevent_dce = res;
}
@group(2) @binding(0) var<storage, read_write> prevent_dce : u32;

@vertex
fn vertex_main() -> @builtin(position) vec4<f32> {
  insertBits_e3e3a2();
  return vec4<f32>();
}

@fragment
fn fragment_main() {
  insertBits_e3e3a2();
}

@compute @workgroup_size(1)
fn compute_main() {
  insertBits_e3e3a2();
}
