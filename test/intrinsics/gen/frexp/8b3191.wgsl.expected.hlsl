groupshared uint arg_1;

void frexp_8b3191() {
  float tint_tmp;
  float tint_tmp_1 = frexp(1.0f, tint_tmp);
  arg_1 = uint(tint_tmp);
  float res = tint_tmp_1;
}

struct tint_symbol_1 {
  uint local_invocation_index : SV_GroupIndex;
};

[numthreads(1, 1, 1)]
void compute_main(tint_symbol_1 tint_symbol) {
  const uint local_invocation_index = tint_symbol.local_invocation_index;
  if ((local_invocation_index == 0u)) {
    arg_1 = 0u;
  }
  GroupMemoryBarrierWithGroupSync();
  frexp_8b3191();
  return;
}
