(* 
   file: a03q01.ml
   name: Christian Elliott
 *)


exception IgnoreCare;;
exception NotImplemented;;

(* end boilerplate *)

(* let rec power x n =
 *   if n > 0 then
 *     x * (power x (n - 1))     (* this is equal to x*x^(n-1) *)
 *   else
 *     1;; *)

(* let rec sum_to n = 
 * if n <= 0 then 0
 * else if n > 1 then
 * n + sum_to (n - 1)
 * else 1;; *)

(* let head n = match n with
 *     [] -> []
 *   | x::xs -> x;; *)

let tail n = match n with
    (* we SHOULD have an empty list exception here *)
    [] -> []
  | x::xs -> xs;;

let second n = match n with
    [] -> []
  | x::xs -> (head xs)
