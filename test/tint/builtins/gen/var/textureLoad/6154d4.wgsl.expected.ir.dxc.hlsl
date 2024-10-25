struct VertexOutput {
  float4 pos;
  uint4 prevent_dce;
};

struct vertex_main_outputs {
  nointerpolation uint4 VertexOutput_prevent_dce : TEXCOORD0;
  float4 VertexOutput_pos : SV_Position;
};


RWByteAddressBuffer prevent_dce : register(u0);
Texture2D<uint4> arg_0 : register(t0, space1);
uint4 textureLoad_6154d4() {
  int2 arg_1 = (int(1)).xx;
  int arg_2 = int(1);
  int v = arg_2;
  int2 v_1 = int2(arg_1);
  uint4 res = uint4(arg_0.Load(int3(v_1, int(v))));
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, textureLoad_6154d4());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, textureLoad_6154d4());
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = textureLoad_6154d4();
  VertexOutput v_2 = tint_symbol;
  return v_2;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_3 = vertex_main_inner();
  vertex_main_outputs v_4 = {v_3.prevent_dce, v_3.pos};
  return v_4;
}

