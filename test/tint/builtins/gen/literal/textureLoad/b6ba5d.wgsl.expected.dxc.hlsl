Texture2DArray arg_0 : register(t0, space1);

void textureLoad_b6ba5d() {
  float res = arg_0.Load(uint4(uint3((1u).xx, uint(1)), uint(1))).x;
}

struct tint_symbol {
  float4 value : SV_Position;
};

float4 vertex_main_inner() {
  textureLoad_b6ba5d();
  return (0.0f).xxxx;
}

tint_symbol vertex_main() {
  const float4 inner_result = vertex_main_inner();
  tint_symbol wrapper_result = (tint_symbol)0;
  wrapper_result.value = inner_result;
  return wrapper_result;
}

void fragment_main() {
  textureLoad_b6ba5d();
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  textureLoad_b6ba5d();
  return;
}
