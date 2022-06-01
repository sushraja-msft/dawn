builtins/gen/smoothstep/c11eef.wgsl:28:24 warning: use of deprecated builtin
  var res: vec2<f32> = smoothStep(vec2<f32>(), vec2<f32>(), vec2<f32>());
                       ^^^^^^^^^^

#version 310 es

void smoothStep_c11eef() {
  vec2 res = smoothstep(vec2(0.0f), vec2(0.0f), vec2(0.0f));
}

vec4 vertex_main() {
  smoothStep_c11eef();
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

void smoothStep_c11eef() {
  vec2 res = smoothstep(vec2(0.0f), vec2(0.0f), vec2(0.0f));
}

void fragment_main() {
  smoothStep_c11eef();
}

void main() {
  fragment_main();
  return;
}
#version 310 es

void smoothStep_c11eef() {
  vec2 res = smoothstep(vec2(0.0f), vec2(0.0f), vec2(0.0f));
}

void compute_main() {
  smoothStep_c11eef();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main();
  return;
}
