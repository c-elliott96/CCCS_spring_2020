#include <iostream>
#include <limits>
#include <stdio.h> 

//====================
// Function Prototypes
int get_len(char s[]);
void copy_str(char n[], char o[]);
void rm_lead_space(char n[], char o[]);
void print_str(char s[]);
void print_ascii_ints();
bool is_alpha(char x);
//====================


//====================
// constants
const int MAX_BUF = 1024;
//====================


int get_len(char s[]) // get length of any char []
{
  int len = 0;
  while (s[len] != '\0')
    {
      ++len;
    }
  return len;
}


void copy_str(char n[], char o[]) // copy one char [] to another char []
{
  int n_len = get_len(n);
  int o_len = n_len;
  for (int i = 0; i <= o_len; ++i)
    {
      o[i] = n[i];
    }
}


void rm_lead_space(char n[], char o[]) // removes leading spaces in n and copies result to o
{
  int n_len = get_len(n);
  int n_it = 0;
  int spaces = 0;
  while (n[n_it] == ' ')
    {
      ++spaces;
      ++n_it;
    }

  // int o_len = n_len - spaces;
  int j = spaces;
  for (int i = 0; i < n_len - spaces; ++i)
    {
      o[i] = n[j];
      ++j;
    }
  o[n_len - spaces] = '\0'; // !!!! I'm not sure why I need this. confusion
                            // on '\0'
}


void print_str(char s[])
{
  for (int i = 0; i < get_len(s); ++i)
    {
      std::cout << s[i] << ' ' << is_alpha(s[i]) << '\n';
    }
}


void print_ascii_ints()
{
  std::cout << "0 = " << int('0') << ' ' << int('0') - 48 << '\n';
  std::cout << "1 = " << int('1') << ' ' << int('1') - 48 << '\n';
  std::cout << "2 = " << int('2') << ' ' << int('2') - 48 << '\n';
  std::cout << "3 = " << int('3') << ' ' << int('3') - 48 << '\n';
  std::cout << "4 = " << int('4') << ' ' << int('4') - 48 << '\n';
  std::cout << "5 = " << int('5') << ' ' << int('5') - 48 << '\n';
  std::cout << "6 = " << int('6') << ' ' << int('6') - 48 << '\n';
  std::cout << "7 = " << int('7') << ' ' << int('7') - 48 << '\n';
  std::cout << "8 = " << int('8') << ' ' << int('8') - 48 << '\n';
  std::cout << "9 = " << int('9') << ' ' << int('9') - 48 << '\n';
}


bool is_alpha(char x)
{
  return ((int(x) >= 65 && int(x) <= 90) || (int(x) >= 97 && int(x) <= 122));
}
  

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

      char o [MAX_BUF];
      rm_lead_space(s, o);
      // std::cout << '[' << s << "]\n";
      // std::cout << '[' << o << "]\n";
      print_str(o);
    }

  

  return 0;
}
