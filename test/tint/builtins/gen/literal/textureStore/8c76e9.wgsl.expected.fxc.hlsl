RWTexture1D<int4> arg_0 : register(u0, space1);

void textureStore_8c76e9() {
  arg_0[1u] = (1).xxxx;
}

struct tint_symbol {
  float4 value : SV_Position;
};

float4 vertex_main_inner() {
  textureStore_8c76e9();
  return (0.0f).xxxx;
}

tint_symbol vertex_main() {
  const float4 inner_result = vertex_main_inner();
  tint_symbol wrapper_result = (tint_symbol)0;
  wrapper_result.value = inner_result;
  return wrapper_result;
}

void fragment_main() {
  textureStore_8c76e9();
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  textureStore_8c76e9();
  return;
}
