cbuffer cbuffer_u : register(b0) {
  uint4 u[12];
};
RWByteAddressBuffer s : register(u1);

float3x3 u_load(uint offset) {
  const uint scalar_offset = ((offset + 0u)) / 4;
  const uint scalar_offset_1 = ((offset + 16u)) / 4;
  const uint scalar_offset_2 = ((offset + 32u)) / 4;
  return float3x3(asfloat(u[scalar_offset / 4].xyz), asfloat(u[scalar_offset_1 / 4].xyz), asfloat(u[scalar_offset_2 / 4].xyz));
}

[numthreads(1, 1, 1)]
void f() {
  float3x3 t = transpose(u_load(96u));
  float l = length(asfloat(u[1].xyz).zxy);
  float a = abs(asfloat(u[1].xyz).zxy.x);
  s.Store(0u, asuint(((t[0].x + float(l)) + float(a))));
  return;
}
