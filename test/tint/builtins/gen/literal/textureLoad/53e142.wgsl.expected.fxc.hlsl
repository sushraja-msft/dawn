Texture2DArray<uint4> arg_0 : register(t0, space1);
RWByteAddressBuffer prevent_dce : register(u0, space2);

void textureLoad_53e142() {
  uint4 res = arg_0.Load(uint4(uint3((1u).xx, uint(1)), uint(1)));
  prevent_dce.Store4(0u, asuint(res));
}

struct tint_symbol {
  float4 value : SV_Position;
};

float4 vertex_main_inner() {
  textureLoad_53e142();
  return (0.0f).xxxx;
}

tint_symbol vertex_main() {
  float4 inner_result = vertex_main_inner();
  tint_symbol wrapper_result = (tint_symbol)0;
  wrapper_result.value = inner_result;
  return wrapper_result;
}

void fragment_main() {
  textureLoad_53e142();
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  textureLoad_53e142();
  return;
}
