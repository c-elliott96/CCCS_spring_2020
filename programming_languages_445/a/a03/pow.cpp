#include <iostream>

int main()
{
	int pow(int x, int n)
	{
		if (n > 0)
		{
			return x += pow(x, n - 1)
		}
		else
			return x += 1;
	}

	int x, n;
	std::cin >> x >> n;
	std::cout << "pow(x, n) = " << pow(x, n) << std::endl;
	return 0;
}
