#version 310 es

void f() {
  int a = 4;
  ivec3 b = ivec3(0, 2, 0);
  ivec3 r = (4 % ivec3(0, 2, 0));
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  f();
  return;
}
