#version 310 es

void all_353d6a() {
  bool res = false;
}

vec4 vertex_main() {
  all_353d6a();
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

void all_353d6a() {
  bool res = false;
}

void fragment_main() {
  all_353d6a();
}

void main() {
  fragment_main();
  return;
}
#version 310 es

void all_353d6a() {
  bool res = false;
}

void compute_main() {
  all_353d6a();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main();
  return;
}
