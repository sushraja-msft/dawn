#version 310 es
#extension GL_AMD_gpu_shader_half_float: require


struct mat2x3_f16_std140 {
  f16vec3 col0;
  f16vec3 col1;
};

layout(binding = 0, std140)
uniform u_block_std140_1_ubo {
  mat2x3_f16_std140 inner[4];
} v;
layout(binding = 1, std430)
buffer s_block_1_ssbo {
  float16_t inner;
} v_1;
f16mat2x3 p[4] = f16mat2x3[4](f16mat2x3(f16vec3(0.0hf), f16vec3(0.0hf)), f16mat2x3(f16vec3(0.0hf), f16vec3(0.0hf)), f16mat2x3(f16vec3(0.0hf), f16vec3(0.0hf)), f16mat2x3(f16vec3(0.0hf), f16vec3(0.0hf)));
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  mat2x3_f16_std140 v_2[4] = v.inner;
  f16mat2x3 v_3[4] = f16mat2x3[4](f16mat2x3(f16vec3(0.0hf), f16vec3(0.0hf)), f16mat2x3(f16vec3(0.0hf), f16vec3(0.0hf)), f16mat2x3(f16vec3(0.0hf), f16vec3(0.0hf)), f16mat2x3(f16vec3(0.0hf), f16vec3(0.0hf)));
  {
    uint v_4 = 0u;
    v_4 = 0u;
    while(true) {
      uint v_5 = v_4;
      if ((v_5 >= 4u)) {
        break;
      }
      v_3[v_5] = f16mat2x3(v_2[v_5].col0, v_2[v_5].col1);
      {
        v_4 = (v_5 + 1u);
      }
      continue;
    }
  }
  p = v_3;
  p[1] = f16mat2x3(v.inner[2].col0, v.inner[2].col1);
  p[1][0] = v.inner[0].col1.zxy;
  p[1][0][0u] = v.inner[0].col1.x;
  v_1.inner = p[1][0].x;
}
