RWByteAddressBuffer prevent_dce : register(u0, space2);

void select_cb9301() {
  bool2 res = (true).xx;
  prevent_dce.Store(0u, asuint((all((res == (false).xx)) ? 1 : 0)));
}

struct tint_symbol {
  float4 value : SV_Position;
};

float4 vertex_main_inner() {
  select_cb9301();
  return (0.0f).xxxx;
}

tint_symbol vertex_main() {
  float4 inner_result = vertex_main_inner();
  tint_symbol wrapper_result = (tint_symbol)0;
  wrapper_result.value = inner_result;
  return wrapper_result;
}

void fragment_main() {
  select_cb9301();
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  select_cb9301();
  return;
}
