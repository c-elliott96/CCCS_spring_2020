(* Christian Elliott python interpreter written in ocaml, final project 
   CISS445 CCCS Spring 2020 *)

#use "regex_rules.mml.ml"

let _ =
  print_string
    "     ##########################################################################################
     # Welcome to PyCaml, the Python calculator and basic interpreter written in Ocaml.       #
     # This program allows you to do basic arithmetic, if/else statements, and relational     #
     # comparisons using Python syntax. It is a demonstration of building a basic interpreter.#
     # Version 0.1.                                                                           #
     ##########################################################################################\n";;


(* let rec lex_buf_walker buf = match buf with
 *     [] -> print_string "Empty buffer";
 *   | x::xs -> Printf.printf x; lex_buf_walker xs
 * ;;
 * 
 * lex_buf_walker newlexbuf;; *)

newlexbuf;;
