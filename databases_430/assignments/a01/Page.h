#ifndef PAGE_H
#define PAGE_H

#include <iostream>
#include <vector>
#include <string>


class Page
{
 public:
  bool isDirty;
  bool inFrameList;
  int frameID;
  std::string str;

  Page() // default constructor
    {
      isDirty = false;
      inFrameList = false;
    }
  Page(int frameID_, std::string str_)
    : frameID(frameID_), str(str_)
    {
      isDirty = false;
      inFrameList = false;
    }

  ~Page()
    {}
};


#endif
