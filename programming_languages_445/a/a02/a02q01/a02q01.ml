(*
 File: a02q01.ml
 Name: Christian Elliott
 *)

exception IgnoreCare;;
exception NotImplemented;;

(* let max = fun max -> (fun x -> (fun y -> (if x > y then x else y))) ;;
   let max = fun max -> fun x -> fun y -> if x > y then x else y;;
   *)
   
let max = fun x ->
fun y ->
fun z ->
if y > z then y
else
z;;

let f = max 1 2 3;;
print_int f;;
print_string " \n";;
