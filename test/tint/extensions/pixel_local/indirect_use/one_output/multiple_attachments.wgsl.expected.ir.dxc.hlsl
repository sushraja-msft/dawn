struct PixelLocal {
  uint a;
  int b;
  float c;
};

struct f_outputs {
  float4 tint_symbol : SV_Target0;
};

struct f_inputs {
  float4 pos : SV_Position;
};


static PixelLocal P = (PixelLocal)0;
RasterizerOrderedTexture2D<uint4> pixel_local_a : register(u1);
RasterizerOrderedTexture2D<int4> pixel_local_b : register(u6);
RasterizerOrderedTexture2D<float4> pixel_local_c : register(u3);
void f0() {
  P.a = (P.a + 9u);
}

void f1() {
  f0();
  P.a = (P.a + 8u);
}

void f2() {
  P.a = (P.a + 7u);
  f1();
}

float4 f_inner() {
  f2();
  return (2.0f).xxxx;
}

f_outputs f(f_inputs inputs) {
  uint2 v = uint2(inputs.pos.xy);
  P.a = pixel_local_a.Load(v).x;
  P.b = pixel_local_b.Load(v).x;
  P.c = pixel_local_c.Load(v).x;
  f_outputs v_1 = {f_inner()};
  pixel_local_a[v] = P.a.xxxx;
  pixel_local_b[v] = P.b.xxxx;
  pixel_local_c[v] = P.c.xxxx;
  return v_1;
}

