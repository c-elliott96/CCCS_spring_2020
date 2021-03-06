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

let rec power2 x n =
  if n > 0 then 
    (if n mod 2 == 0 then
       (power2 x (n / 2)) * (power2 x (n / 2))
     else
       x * (power2 x ((n - 1) / 2) * power2 x ((n - 1) / 2))
    )
  else
    1;;
