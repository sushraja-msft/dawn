RWByteAddressBuffer prevent_dce : register(u0, space2);

void tanh_5724b3() {
  float2 res = (0.76159417629241943359f).xx;
  prevent_dce.Store2(0u, asuint(res));
}

struct tint_symbol {
  float4 value : SV_Position;
};

float4 vertex_main_inner() {
  tanh_5724b3();
  return (0.0f).xxxx;
}

tint_symbol vertex_main() {
  float4 inner_result = vertex_main_inner();
  tint_symbol wrapper_result = (tint_symbol)0;
  wrapper_result.value = inner_result;
  return wrapper_result;
}

void fragment_main() {
  tanh_5724b3();
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  tanh_5724b3();
  return;
}
