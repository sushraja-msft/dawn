uint3 tint_div(uint lhs, uint3 rhs) {
  uint3 l = uint3((lhs).xxx);
  return (l / ((rhs == (0u).xxx) ? (1u).xxx : rhs));
}

[numthreads(1, 1, 1)]
void f() {
  uint a = 4u;
  uint3 b = uint3(1u, 2u, 3u);
  uint3 r = tint_div(a, b);
  return;
}
