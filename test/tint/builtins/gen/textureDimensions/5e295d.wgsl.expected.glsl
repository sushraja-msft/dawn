#version 310 es

layout(rgba16ui) uniform highp writeonly uimage2DArray arg_0;
void textureDimensions_5e295d() {
  ivec2 res = imageSize(arg_0).xy;
}

vec4 vertex_main() {
  textureDimensions_5e295d();
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

layout(rgba16ui) uniform highp writeonly uimage2DArray arg_0;
void textureDimensions_5e295d() {
  ivec2 res = imageSize(arg_0).xy;
}

void fragment_main() {
  textureDimensions_5e295d();
}

void main() {
  fragment_main();
  return;
}
#version 310 es

layout(rgba16ui) uniform highp writeonly uimage2DArray arg_0;
void textureDimensions_5e295d() {
  ivec2 res = imageSize(arg_0).xy;
}

void compute_main() {
  textureDimensions_5e295d();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main();
  return;
}
