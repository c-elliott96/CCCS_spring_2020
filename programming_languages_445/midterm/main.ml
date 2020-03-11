(* Name: Christian Elliott
   File: main.ml 
 *)

let initBoard n = Array.make (n * n) ' ';;

let printBorder n = 
for i = 1 to n do
    print_string "+-"
done;
print_string "+\n"
;;


let printBoard n board = 
printBorder n; 
print_string "|";
for i = 1 to (Array.length board) do
    Printf.printf("%c|") board.(i - 1);
    if (i mod n = 0) 
    then (print_string "\n"; printBorder n; 
        if (i != Array.length board) 
        then print_string "|")
done
;;


(*And then here is main: *)
let main () =
    let _ = print_string
          "Welcome to Tic-Tac-Toe Ocaml! Enter the size of the board: " in
    let n = read_int () in
    play n (initBoard n) 'X'
;;
           
     
main ();; 


(* this function works - it prompts for a number until it receives 42
let rec play () = 
let _ = print_string "give me a number: " in
let inp = read_int () in
if inp = 42 then
    print_string "correct\n" 
else
    print_string "Incorrect. Try again.\n" in 
    play ()
;;

(* this function checks to see if a play is valid *)
let player_move_validation move board = 
  if board.(move) == ' ' then
    board.(move) <- 'X'
  else print_string "Invalid move; please try again.\n"
 *)

(* make a board index calculation function *)
(* let calculate_move row col n =
 *   (n * row) + col;; *)


(* here is how we will take in the player's move,
   check to ensure that the spot is unoccupied, 
   and then modify the board array if true, 
   if false, ask for a new move *)
(* let rec get_player_move board n =
 *   let _ = print_string "row: " in
 *   let row = read_int () in
 *   let _ = print_string "col: " in
 *   let col = read_int () in
 *   let move = calculate_move row col n in 
 *   if (player_move_validation move board) then
 *     (\* if true, it's a valid move. *\)
 *     board.(move) <- 'X'
 *   else
 *     let _ = print_string "Invalid move. Please try again.\n" in
 *     get_player_move board n
 * ;; *)

let rec player_row_check
          (* finish implementing this function! *) 
