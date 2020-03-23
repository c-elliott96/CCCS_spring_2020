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


let printBoard board n = 
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
    let board = initBoard n in
    get_player_move board n
;;
           
     
main ();; 


(* the logic in main needs to be adjusted. I need to be able to reference board by name *)

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
 *)

(* this function checks to see if a play is valid *)
(* let player_move_validation move board = 
 *   if board.(move) == ' ' then
 *     board.(move) <- 'X'
 *   else print_string "Invalid move; please try again.\n"
 * ;; *)

(* bool version of function immediately above *)
let player_move_validation move board =
  board.(move) == ' ';;


let make_player_move move board =
  board.(move) <- 'X'
;;

(* make a board index calculation function *)
let calculate_move row col n =
  (n * row) + col;;


(* here is how we will take in the player's move,
   check to ensure that the spot is unoccupied, 
   and then modify the board array if true, 
   if false, ask for a new move *)

let rec get_player_move board n =
  print_string "row: ";
  let row = read_int () in
  print_string "col: ";
  let col = read_int () in
  let move = calculate_move row col n in
  if (player_move_validation move board) then
    board.(move) <- 'X'
  else
    begin
      print_string "Invalid move. Please try again.\n";
      get_player_move board n;
    end
;;

(* let player_row_check board row col n = 
 *   let ref col_ref = 0 in
 *   let winning_move = 
 *   for row_ref = 0 to n do
 *     let move = calculate_move !row_ref !col_ref n in
 *     let winning_move = board.(move) = 'X';
 *   done
 * ;; *)

(* this function checks row of board to see if all = 'X' *) 
let check_row board row n = 
let temp = Array.sub board (row * n) n in
Array.for_all ((=) 'X') temp
;;


let check_col board col n =
  let temp = Array.make n ' ' in
  let j = ref 0 in
  for i = 0 to (n * n - 1) do
    Printf.printf("i = %d\n") i;
    if ((i mod n) = col) then
      begin
        temp.(!j) <- board.(i);
        j := !j + 1;
      end
  done;
  print_array temp;
  Array.for_all ((=) 'X') temp
;;
      

let check_diag_right board n =
  let temp = Array.make n ' ' in
  let row = ref 0 in
  for i = 0 to (n * n) do
    if (i mod (n + 1) = 0) then
      begin
        temp.(!row) <- board.(i);
        row := !row + 1;
      end
  done;
  (* print my temp array for debugging *)
  print_array temp;
  Array.for_all ((=) 'X') temp
;;


let print_arr array_val =
  Printf.printf("%c ") array_val;;


let print_array array =
  Array.iter print_arr array;;


let check_diag_left board n =
  let temp = Array.make n ' ' in
  let row = ref 0 in
  for i = 0 to ((n * n) - 1) do
    if (i mod (n - 1) = 0 && (i != 0) && i != ((n * n) - 1)) then
       begin
         temp.(!row) <- board.(i);
         row := !row + 1;
       end
  done;
  print_array temp;
  Array.for_all ((=) 'X') temp
;;
