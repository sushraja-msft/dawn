#version 310 es

layout(binding = 0, std140)
uniform u_block_std140_1_ubo {
  vec2 inner_col0;
  vec2 inner_col1;
  vec2 inner_col2;
  vec2 inner_col3;
} v;
shared mat4x2 w;
void f_inner(uint tint_local_index) {
  if ((tint_local_index == 0u)) {
    w = mat4x2(vec2(0.0f), vec2(0.0f), vec2(0.0f), vec2(0.0f));
  }
  barrier();
  w = mat4x2(v.inner_col0, v.inner_col1, v.inner_col2, v.inner_col3);
  w[1] = mat4x2(v.inner_col0, v.inner_col1, v.inner_col2, v.inner_col3)[0];
  w[1] = mat4x2(v.inner_col0, v.inner_col1, v.inner_col2, v.inner_col3)[0].yx;
  w[0][1] = mat4x2(v.inner_col0, v.inner_col1, v.inner_col2, v.inner_col3)[1][0];
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  f_inner(gl_LocalInvocationIndex);
}
