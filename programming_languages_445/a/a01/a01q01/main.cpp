#include <iostream>
#include <limits>


const int MAX_BUF = 1024;


int main()
{
  while(1)
    {
      char s[MAX_BUF];
      std::cout << ">>> ";
      std::cin.getline(s, MAX_BUF);
      if (std::cin.eof()) break;
      if (std::cin.fail() || std::cin.bad())
	{
	  std::cin.clear();
	  std::cin.ignore(std::numeric_limits<std::streamsize>::max());
	}

      std::cout << '[' << s << "]\n";
    }

  return 0;
}
