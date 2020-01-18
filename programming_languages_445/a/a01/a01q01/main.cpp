#include <iostream>
#include <limits>
#include <stdio.h>
#include <string.h>
#include <string>

//====================
// Function Prototypes
int get_len(char s[]);
void copy_str(char n[], char o[]);
void rm_lead_space(char n[], char o[]);
void print_str(char s[]);
void print_ascii_ints();
bool is_alpha(char x);
void split_by_spaces(char s[]);
//====================


//====================
// constants
const int MAX_BUF = 1024;
//====================


// int get_len(char s[]) // get length of any char []
// {
//   return sizeof(s)/sizeof(*s) + 1;
// }


void copy_str(char n[], char o[]) // copy one char [] to another char []
{
  // int n_len = get_len(n);
  // int o_len = n_len;
  // for (int i = 0; i <= o_len; ++i)
  //   {
  //     o[i] = n[i];
  //   }
}


void rm_lead_space(std::string n) // removes leading spaces in n
{
  int n_len = n.length();
  int n_it = 0;
  int spaces = 0;
  while (n[n_it] == ' ')
    {
      ++spaces;
      ++n_it;
    }
  std::string o;
  int j = spaces;
  for (int i = 0; i < n_len - spaces; ++i)
    {
      o.push_back(n[j]);
      ++j;
    }
  n.clear();
  n = o;
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


void print_split_by_spaces(char s[]) // strtok() changes your array! consider copying input array and storing toks in an array of vectors 
{
  char *tok;
  const char delim[2] = " ";
  tok = strtok(s, delim);
  while (tok != NULL)
    {
      printf("%s\n", tok);
      tok = strtok(NULL, delim);
    }
}


int main()
{
  while(1)
    {
      std::string s;
      std::getline(std::cin, s);
      
      std::cout << s << '\n';
      std::cout << "length: " << s.length() << '\n';
      rm_lead_space(s);
      rm_trail_space(s);
      std::cout << s << '\n';
    }

  return 0;
}
