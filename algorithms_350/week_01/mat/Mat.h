#ifndef MAT_H
#define MAT_H
#include <iostream>

class Mat
{
 public:
  Mat(int, int); // constructor 
  Mat(int, int, double); // constructor and fill using double
  Mat(const Mat &); // copy constructor 
  ~Mat();
  int nrows() const;
  int ncols() const;
  double operator()(int, int) const;
  double & operator()(int, int);
 private:
  int nrows_;
  int ncols_;
  double * p_;
};


//inline      // why inline? 
std::ostream & operator<<(std::ostream &, const Mat &);


#endif
