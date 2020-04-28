{ open Parser }

rule token =
     parse [' ' '\t' '\r'] { token lexbuf }
     | '+'                      { PLUS }
     | '-'                      { MINUS }
     | '*'                      { TIMES }
     | '/'                      { DIVIDE }
     | ['0'-'9']+ as lit        { LITERAL(int_of_string lit) }
     | eof | '\n'               { EOF }