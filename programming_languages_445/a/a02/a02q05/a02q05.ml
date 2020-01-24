(*
  File: a02q02.ml
  Name: Christian Elliott
 *)

exception IgnoreCase;;
exception NotImplemented;;

(* end boilerplate *)

let div_func f g = fun x -> (f x) /. (g x);;

(* let f x = x +. 1.0;;
 * let g x = x -. 1.0;;
 * let h x = x *. x;;
 * 
 * let one = (add_func f g) 0.0;;
 * let two = (add_func f g) 1.0;;
 * let three = (add_func g f) 2.0;;
 * let four = (add_func g f) 3.0;;
 * let five = (add_func f h) 0.0;;
 * let six = (add_func f h) 1.0;;
 * let seven = (add_func h f) 2.0;;
 * 
 * 
 * print_float one;;
 * print_string " ";;
 * print_float two;;
 * print_string " ";;
 * print_float three;;
 * print_string " ";;
 * print_float four;;
 * print_string " ";;
 * print_float five;;
 * print_string " ";;
 * print_float six;;
 * print_string " ";;
 * print_float seven;;
 * print_string " \n";; *)

(* let add_func f g = fun x -> f +. (g x);; *)
