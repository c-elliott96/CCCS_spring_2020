(*
 File: a02q01.ml
 Name: Christian Elliott
 *)

exception IgnoreCare;;
exception NotImplemented;;

let max = fun max -> (fun x -> (fun y -> (if x > y then x else y)));;

let f = max 1 2 3;;
print_int f;;
print_newline;;

