%{
    open Printf
    let environment = []    /* need to make it so environment isn't ever-expanding */
    let update environment id = 
	 %}

%token <int> INT
%token <string> ID
%token PLUS MINUS MULTIPLY DIVIDE

/* <, >, <=, >=, == */ 
%token L_THAN G_THAN LEQ GEQ EQUAL

%token ASSIGN

%token NEWLINE

%start input
%type <unit> input


%% /* Grammar rules and actions below */

input:    /* empty */ { }
  | input line        { }
;

line:     NEWLINE     { }
  | exp NEWLINE       { printf "\t%.10g\n" $1; flush stdout }
;

exp:     INT          { $1 }
  |      ID           { $1 }
  | exp PLUS exp      { $1 + $3 }
  | exp MINUS exp     { $1 - $3 }
  | exp MULTIPLY exp  { $1 * $3 }
  | exp DIVIDE exp    { $1 / $3 }
  | ID ASSIGN exp     { /* code to update environment? */ }
;




%%


