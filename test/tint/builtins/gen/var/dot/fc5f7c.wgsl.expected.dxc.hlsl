RWByteAddressBuffer prevent_dce : register(u0, space2);

void dot_fc5f7c() {
  int2 arg_0 = (1).xx;
  int2 arg_1 = (1).xx;
  int res = dot(arg_0, arg_1);
  prevent_dce.Store(0u, asuint(res));
}

struct tint_symbol {
  float4 value : SV_Position;
};

float4 vertex_main_inner() {
  dot_fc5f7c();
  return (0.0f).xxxx;
}

tint_symbol vertex_main() {
  float4 inner_result = vertex_main_inner();
  tint_symbol wrapper_result = (tint_symbol)0;
  wrapper_result.value = inner_result;
  return wrapper_result;
}

void fragment_main() {
  dot_fc5f7c();
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  dot_fc5f7c();
  return;
}
