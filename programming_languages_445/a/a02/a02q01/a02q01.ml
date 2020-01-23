(*
 File: a02q01.ml
 Name: Christian Elliott
 *)

exception IgnoreCare;;
exception NotImplemented;;

   
let max = fun (x : int) -> fun (y : int) -> fun (z : int) ->
if x > y && x > z then x
else if y > x && y > z then y
else z;;

let f = max 1 2 3;;
print_int f;;
print_string " \n";;
