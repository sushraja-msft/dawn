RWTexture3D<float4> arg_0 : register(u0, space1);

void textureStore_eb702f() {
  arg_0[(1).xxx] = (1.0f).xxxx;
}

struct tint_symbol {
  float4 value : SV_Position;
};

float4 vertex_main_inner() {
  textureStore_eb702f();
  return (0.0f).xxxx;
}

tint_symbol vertex_main() {
  float4 inner_result = vertex_main_inner();
  tint_symbol wrapper_result = (tint_symbol)0;
  wrapper_result.value = inner_result;
  return wrapper_result;
}

void fragment_main() {
  textureStore_eb702f();
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  textureStore_eb702f();
  return;
}
