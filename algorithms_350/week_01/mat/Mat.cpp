#include "Mat.h"
#include <iostream>

Mat::Mat(int nrows, int ncols)
  : nrows_(nrows), ncols_(ncols),
    p_(new double [nrows * ncols])
{}


Mat::Mat(int nrows, int ncols, double v)
  : nrows_(nrows), ncols_(ncols),
    p_(new double [nrows * ncols])
{
  for (int i = 0; i < nrows_ * ncols_; ++i)
    {
      p_[i] = v;
    }
}


double Mat::operator()(int r, int c) const
{
  return p_[r * ncols_ + c];  
}


Mat::Mat(const Mat & m)
  : nrows_(m.nrows_), ncols_(m.ncols_),
    p_(new double[m.nrows_ * m.ncols_])
{
  for (int i = 0; i < nrows_ * ncols_; ++i)
    {
      p_[i] = m.p_[i]; 
    }
}


Mat::~Mat()
{
  delete [] p_;
}

double & Mat::operator()(int r, int c)
{
  return p_[r * ncols_ + c];  
}


int Mat::ncols() const
{
  return ncols_;
}


int Mat::nrows() const
{
  return nrows_;
}


std::ostream & operator<<(std::ostream &cout, const Mat & m)
{
  cout << '[';
  for (int r = 0; r < m.nrows(); ++r)
    {
      if (r > 0)
	{
	  cout << ' ';
	}
      cout << '[';
      for (int c = 0; c < m.ncols(); ++c)
	{
	  cout << m(r, c);
	  if (c < m.ncols() - 1)
	    {
	      cout << ' ';
	    }
	}
      cout << ']';
      if (r < m.nrows() - 1)
	{
	  cout << '\n';
	}
    }
  //cout << "]\n";
  
  return cout;
}
