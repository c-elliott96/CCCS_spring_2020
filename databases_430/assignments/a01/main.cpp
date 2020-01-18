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
// Constant Declarations
// ======================================================
const int FILE_NUM_BLOCKS = 5;
const int BLOCK_BYTES = 4;
const int NUM_FRAMES_TO_SHOW = 3;
const int BUF_SIZE = FILE_NUM_BLOCKS * BLOCK_BYTES; 

// ======================================================
// Function Prototypes
// ======================================================
void printCharArray(const char *, int);
int blockStart(int, int);
int printMenu(const std::vector<Page *> &);
void copyStrToObjs(const char [], std::vector<Page *>);
void printActiveFrames(const std::vector<Page *> &);

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


// void printActivePages(const std::vector<Page *> &abc)
// {
  
// }


int printMenu(const std::vector<Page *> &abc)
{
  std::cout << "[0] Fetch a page into memory \n"
	    << "[1] Write frame \n"
	    << "[2] Shutdown \n"
	    << "Frames: ";
  printActiveFrames(abc);
  int option;
  std::cout << "option: ";
  std::cin >> option;

  return option;
}


void printActiveFrames(const std::vector <Page *> &abc)
{
  int print_count = 0;
  for (int i = 0; i < abc.size(); ++i)
    {
      if (abc[i]->inFrameList) 
	{
	  std::cout << '[';
	  if (abc[i]->isDirty)
	    {
	      std::cout << '*';
	    }
	  std::cout << abc[i]->frameID << ':';
	  std::cout << abc[i]->str << "] ";
	  ++print_count;
	}
    }
  if (print_count <= 2)
    {
      while(print_count <= 2)
	{
	  std::cout << "[]";
	  ++print_count;
	}
    }
  std::cout << '\n';
}


void copyStrToObjs(const char pathname[1000],
		   std::vector<Page *> abc)
/* aka read from file to work on it in objs form */
{
  int fd = open(pathname, O_RDWR);
  char buf[BUF_SIZE];
  int read_int = read(fd, buf, BUF_SIZE);
  for (int i = 0; i < BUF_SIZE; ++i)
    {
      //std::cout << buf[i] << ' ';
      for (int j = 0; j < 4; ++j)
      	{
      	  if (i < 4) // 0 - 3
      	    abc[j]->str[j] = buf[i];
      	  else if (i >= 4 && i <= 7) // 4 - 3
      	    abc[j]->str[j] = buf[i];
      	  else if (i >= 8 && i <= 11) // 8 - 11
      	    abc[j]->str[j] = buf[i];
      	  else if (i >= 12 && i <= 15) // 12 - 15
      	    abc[j]->str[j] = buf[i];
      	  else // 16 - 19
      	    abc[j]->str[j] = buf[i];
      	}
    }
}


int main()
{
  // ======================================================
  // I/O stuff ...
  
  // // char array to hold path to file for I/O
  char pathname[1000] = "/home/student/CCCS/CCCS_spring_2020/databases_430/assignments/a01/abc";
  
  // open() returns an int based on how the function exited --> see posix i/o docs
  int fd = open(pathname, O_RDWR | O_CREAT, 0644);
  // if (fd < 0)
  //   {
  //     std::cout << "open fail\n";
  //     std::cout << "errno: " << errno << std::endl;
  //     std::cout << "strerror: " << strerror(errno) << std::endl;
  //   }
  // else
  //   {
  //     std::cout << "open ok" << std::endl;
  //   }

  char buf[BUF_SIZE];
  for (int i = 0; i < FILE_NUM_BLOCKS * BLOCK_BYTES; ++i)
    {
      if (i < 4) // 0 - 3
	buf[i] = 'a';
      else if (i >= 4 && i <= 7) // 4 - 3
	buf[i] = 'b';
      else if (i >= 8 && i <= 11) // 8 - 11
	buf[i] = 'c';
      else if (i >= 12 && i <= 15) // 12 - 15
	buf[i] = 'd';
      else // 16 - 19
	buf[i] = 'e';
    }
  int n_write = write(fd, buf, BUF_SIZE);
  //std::cout << "after n_write ... " << fd << '\n';
  close(fd);
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

  // int abc_len = FILE_NUM_BLOCKS * BLOCK_BYTES;
  // char abc[abc_len] = { 'a', 'a', 'a', 'a',
  // 			'b', 'b', 'b', 'b',
  // 			'c', 'c', 'c', 'c',
  // 			'd', 'd', 'd', 'd',
  // 			'e', 'e', 'e', 'e' };
  // int framesToShow[NUM_FRAMES_TO_SHOW];
  // =================================================

  // =================================================
  // main vector & Page objects init
  // =================================================
  std::vector <Page *> abc;
  for (int i = 0; i < FILE_NUM_BLOCKS; ++i)
    {
      abc.push_back(new Page);
      abc[i]->frameID = i;
      // int x = i;
      // switch(x)
      // 	{
      // 	case 0:
      // 	  for (int j = 0; j < 4; ++j)
      // 	    {
      // 	      abc[i]->str[j] = 'a';
      // 	    }
      // 	  abc[i]->byteOffset = 0;
      // 	  break;
      // 	case 1:
      // 	  for (int j = 0; j < 4; ++j)
      // 	    {
      // 	      abc[i]->str[j] = 'b';
      // 	    };
      // 	  abc[i]->byteOffset = 4;
      // 	  break;
      // 	case 2:
      // 	  for (int j = 0; j < 4; ++j)
      // 	    {
      // 	      abc[i]->str[j] = 'c';
      // 	    };
      // 	  abc[i]->byteOffset = 8;
      // 	  break;
      // 	case 3:
      // 	  for (int j = 0; j < 4; ++j)
      // 	    {
      // 	      abc[i]->str[j] = 'd';
      // 	    }
      // 	  abc[i]->byteOffset = 12;
      // 	  break;
      // 	case 4:
      // 	  for (int j = 0; j < 4; ++j)
      // 	    {
      // 	      abc[i]->str[j] = 'e';
      // 	    }
      // 	  abc[i]->byteOffset = 16;
      // 	  break;
	    
      // 	default:
      // 	  break;
      // 	}
    }

  // ===============================================
  // Begin Main Loop
  // ===============================================
  int x;
  while(x != 2)
    {
      x = printMenu(abc);
      copyStrToObjs(pathname, abc);
      for (int i = 0; i < abc.size(); ++i)
	{
	  for (int j = 0; j < 4; ++j)
	    {
	      std::cout << abc[i]->str[j] << ' ';
	    }
	}
      switch(x)
	{
	case 0:
	  {
	    // fetch a page - specify the page (index of abc
	    // that corresponds with the right page of the file
	    // CAREFUL! if they want to fetch a page and
	    // there are already 3 fetched, we have to ask them
	    // which one they want us to release from the buffer
	    // at which point we need to check and see if it needs
	    // to be written to the disk or not
	    break;
	  }
	case 1:
	  {
	    // write frame - modify the frame contents
	    // in this case, that means ask them to enter 4 chars
	    // to represent the frame modifications
	    break;
	  }
	case 2:
	  {
	    // quit - if no frames are dirty, quit. else,
	    // write the dirty frames and print "halt"
	    break;
	  }
	default:
	  break;
	}
    }
  return 0;
}
