@group(1) @binding(0) var arg_0 : texture_multisampled_2d<u32>;

fn textureLoad_c378ee() {
  var res : vec4<u32> = textureLoad(arg_0, vec2<i32>(1i), 1i);
}

@vertex
fn vertex_main() -> @builtin(position) vec4<f32> {
  textureLoad_c378ee();
  return vec4<f32>();
}

@fragment
fn fragment_main() {
  textureLoad_c378ee();
}

@compute @workgroup_size(1)
fn compute_main() {
  textureLoad_c378ee();
}
