struct VertexOutput {
  float4 pos;
  uint2 prevent_dce;
};

struct vertex_main_outputs {
  nointerpolation uint2 VertexOutput_prevent_dce : TEXCOORD0;
  float4 VertexOutput_pos : SV_Position;
};


RWByteAddressBuffer prevent_dce : register(u0);
uint2 min_82b28f() {
  uint2 arg_0 = (1u).xx;
  uint2 arg_1 = (1u).xx;
  uint2 res = min(arg_0, arg_1);
  return res;
}

void fragment_main() {
  prevent_dce.Store2(0u, min_82b28f());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store2(0u, min_82b28f());
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = min_82b28f();
  VertexOutput v = tint_symbol;
  return v;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_1 = vertex_main_inner();
  vertex_main_outputs v_2 = {v_1.prevent_dce, v_1.pos};
  return v_2;
}

