(* Christian Elliott, a04q02 Programming Languages *)

let range a b =
  let rec aux a b = function
    | [] -> if a <> b then range a b (b-1::[]) else []
    | x::xs -> if x > a then range a b (x-1::x::xs) else x::xs
  in aux a b []
;;
