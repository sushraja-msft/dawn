groupshared uint2 arg_1;

void frexp_e8b4d1() {
  float2 tint_tmp;
  float2 tint_tmp_1 = frexp(float2(0.0f, 0.0f), tint_tmp);
  arg_1 = uint2(tint_tmp);
  float2 res = tint_tmp_1;
}

struct tint_symbol_1 {
  uint local_invocation_index : SV_GroupIndex;
};

[numthreads(1, 1, 1)]
void compute_main(tint_symbol_1 tint_symbol) {
  const uint local_invocation_index = tint_symbol.local_invocation_index;
  if ((local_invocation_index == 0u)) {
    arg_1 = uint2(0u, 0u);
  }
  GroupMemoryBarrierWithGroupSync();
  frexp_e8b4d1();
  return;
}
