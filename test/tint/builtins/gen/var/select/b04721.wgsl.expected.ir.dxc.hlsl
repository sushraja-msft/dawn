struct VertexOutput {
  float4 pos;
  uint3 prevent_dce;
};

struct vertex_main_outputs {
  nointerpolation uint3 VertexOutput_prevent_dce : TEXCOORD0;
  float4 VertexOutput_pos : SV_Position;
};


RWByteAddressBuffer prevent_dce : register(u0);
uint3 select_b04721() {
  uint3 arg_0 = (1u).xxx;
  uint3 arg_1 = (1u).xxx;
  bool arg_2 = true;
  uint3 res = ((arg_2) ? (arg_1) : (arg_0));
  return res;
}

void fragment_main() {
  prevent_dce.Store3(0u, select_b04721());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store3(0u, select_b04721());
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = select_b04721();
  VertexOutput v = tint_symbol;
  return v;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_1 = vertex_main_inner();
  vertex_main_outputs v_2 = {v_1.prevent_dce, v_1.pos};
  return v_2;
}

