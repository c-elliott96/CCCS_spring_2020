#include <iostream>

#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <cerrno>
#include <cstring>
#include <vector>
#include "Page.h"

// Christian Elliott
// 1/12/2020


// ======================================================
// Function Prototypes
// ======================================================
void printCharArray(const char *, int);
int blockStart(int, int);


// ======================================================
// Function Definitions
// ======================================================
void printCharArray(const char * abc, int len)
{
  for (int i = 0; i < len; ++i)
    {
      std::cout << abc[i];
    }
  //std::cout << ' ';
  std::cout << '\n';
}


int blockStart(int block, int block_bytes)
{
  return block * block_bytes;
}


int main()
{
  // ======================================================
  // I/O stuff ...
  
  // // char array to hold path to file for I/O
  // char pathname[1000] = "/home/christian/CCCS/CCCS_spring_2020/databases_430/assignments/a01/poop";


  // // open() returns an int based on how the function exited --> see posix i/o docs
  // int fd = open(pathname, O_RDWR | O_CREAT, 0644);
  // if (fd < 0)
  //   {
  //     std::cout << "open fail\n";
  //     std::cout << "errno: " << errno << std::endl;
  //     std::cout << "strerror: " << strerror(errno) << std::endl;
  //   }
  // else
  //   {
  //     std::cout << "open ok" << std::endl;
  //     std::cout << fd << std::endl;
  //   }
  // =====================================================

  // a single page (in other words, a specific section of 4 of our array chars) can be represented by:
  // page # | index values
  //      0 | 0  -  3
  //      1 | 4  -  7
  //      2 | 8  -  11
  //      3 | 12 -  15
  //      4 | 16 -  19


  // =================================================
  // // Init arrays and display defaults
  //
  // const int FILE_NUM_BLOCKS = 5;
  // const int BLOCK_BYTES = 4;
  // const int NUM_FRAMES_TO_SHOW = 3;
  // int abc_len = FILE_NUM_BLOCKS * BLOCK_BYTES;
  // char abc[abc_len] = { 'a', 'a', 'a', 'a',
  // 			'b', 'b', 'b', 'b',
  // 			'c', 'c', 'c', 'c',
  // 			'd', 'd', 'd', 'd',
  // 			'e', 'e', 'e', 'e' };
  // int framesToShow[NUM_FRAMES_TO_SHOW];
  // =================================================

  

  return 0;
}
