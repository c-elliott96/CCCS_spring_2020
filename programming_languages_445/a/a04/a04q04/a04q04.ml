(* Christian Elliott, a04q04 Programming Languages *)

let slice list a b c =
  let newlist = [] in
  let i = a in
  let rec aux list newlist i a b c = match list with
    | [] -> newlist
    | x::xs -> if x mod c = 0 && i < b then aux (xs) (newlist@[x]) (i+1) a b c else aux (xs) newlist (i+1) a b c
  in aux list newlist i a b c
;;
