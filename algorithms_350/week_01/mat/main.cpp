#include <iostream>
#include "Mat.h"


int main()
{
  Mat m0(2, 3);
  std::cout << "m0:\n" << m0 << '\n';
  Mat m1(2, 3, 0);
  std::cout << "m1:\n" << m1 << '\n';
  
  return 0;
}
