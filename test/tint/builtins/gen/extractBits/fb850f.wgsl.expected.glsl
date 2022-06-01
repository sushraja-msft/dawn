#version 310 es

ivec4 tint_extract_bits(ivec4 v, uint offset, uint count) {
  uint s = min(offset, 32u);
  uint e = min(32u, (s + count));
  return bitfieldExtract(v, int(s), int((e - s)));
}

void extractBits_fb850f() {
  ivec4 res = tint_extract_bits(ivec4(0), 1u, 1u);
}

vec4 vertex_main() {
  extractBits_fb850f();
  return vec4(0.0f);
}

void main() {
  gl_PointSize = 1.0;
  vec4 inner_result = vertex_main();
  gl_Position = inner_result;
  gl_Position.y = -(gl_Position.y);
  gl_Position.z = ((2.0f * gl_Position.z) - gl_Position.w);
  return;
}
#version 310 es
precision mediump float;

ivec4 tint_extract_bits(ivec4 v, uint offset, uint count) {
  uint s = min(offset, 32u);
  uint e = min(32u, (s + count));
  return bitfieldExtract(v, int(s), int((e - s)));
}

void extractBits_fb850f() {
  ivec4 res = tint_extract_bits(ivec4(0), 1u, 1u);
}

void fragment_main() {
  extractBits_fb850f();
}

void main() {
  fragment_main();
  return;
}
#version 310 es

ivec4 tint_extract_bits(ivec4 v, uint offset, uint count) {
  uint s = min(offset, 32u);
  uint e = min(32u, (s + count));
  return bitfieldExtract(v, int(s), int((e - s)));
}

void extractBits_fb850f() {
  ivec4 res = tint_extract_bits(ivec4(0), 1u, 1u);
}

void compute_main() {
  extractBits_fb850f();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main();
  return;
}
