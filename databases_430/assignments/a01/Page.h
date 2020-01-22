#ifndef PAGE_H
#define PAGE_H

#include <iostream>
#include <vector>
#include <string>


class Page
{
 public:
  bool isDirty;        // true if page has been modified without write
  bool inFrameList;    // true if page is currently in the frame list 
  int frameID;         // represents this objects location in main vector
  int byteOffset;      /* represents the "location" of the substring in the
			  actual file */
  std::string str[4];     /* string value of frame - to be only a temporary
                          value until write occurs */

  Page() // default constructor
    {
      isDirty = false;
      inFrameList = false;
      frameID = -1;
      byteOffset = -1;
    }

  ~Page()
    {}
};


#endif
