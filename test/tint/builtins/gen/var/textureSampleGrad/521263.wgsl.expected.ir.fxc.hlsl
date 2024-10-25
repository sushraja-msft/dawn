struct VertexOutput {
  float4 pos;
  float4 prevent_dce;
};

struct vertex_main_outputs {
  nointerpolation float4 VertexOutput_prevent_dce : TEXCOORD0;
  float4 VertexOutput_pos : SV_Position;
};


RWByteAddressBuffer prevent_dce : register(u0);
Texture2D<float4> arg_0 : register(t0, space1);
SamplerState arg_1 : register(s1, space1);
float4 textureSampleGrad_521263() {
  float2 arg_2 = (1.0f).xx;
  float2 arg_3 = (1.0f).xx;
  float2 arg_4 = (1.0f).xx;
  float4 res = arg_0.SampleGrad(arg_1, arg_2, arg_3, arg_4);
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, asuint(textureSampleGrad_521263()));
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, asuint(textureSampleGrad_521263()));
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = textureSampleGrad_521263();
  VertexOutput v = tint_symbol;
  return v;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_1 = vertex_main_inner();
  vertex_main_outputs v_2 = {v_1.prevent_dce, v_1.pos};
  return v_2;
}

