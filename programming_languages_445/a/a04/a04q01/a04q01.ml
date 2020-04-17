(* Christian Elliott, a04q01 Programming Languages *) 

let duplicate x n =
  let list = [] in
  let rec aux x n list = match n with
    | 0 -> list
    | _ -> aux x (n-1) (x::list)
  in aux x n list
;;
