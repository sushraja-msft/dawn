uint tint_div(uint lhs, uint rhs) {
  return (lhs / ((rhs == 0u) ? 1u : rhs));
}

[numthreads(1, 1, 1)]
void f() {
  uint a = 1u;
  uint b = 0u;
  uint r = tint_div(a, (b + b));
  return;
}
