#include <iostream>

#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <cerrno>
#include <cstring>

// Christian Elliott
// 1/12/2020

int main()
{

  // char array to hold path to file for I/O
  char pathname[1000] = "/home/christian/CCCS/CCCS_spring_2020/databases_430/assignments/a01/poop";


  // open() returns an int based on how the function exited --> see posix i/o docs
  int fd = open(pathname, O_RDWR | O_CREAT, 0644);
  if (fd < 0)
    {
      std::cout << "open fail\n";
      std::cout << "errno: " << errno << std::endl;
      std::cout << "strerror: " << strerror(errno) << std::endl;
    }
  else
    {
      std::cout << "open ok" << std::endl;
      std::cout << fd << std::endl;
    }

  return 0;
}
