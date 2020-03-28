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
let check_row board row n c = 
let temp = Array.sub board (row * n) n in
Array.for_all ((=) c) temp
;;


let check_col board col n c =
  let temp = Array.make n ' ' in
  let j = ref 0 in
  for i = 0 to (n * n - 1) do
    if ((i mod n) = col) then
      begin
        temp.(!j) <- board.(i);
        j := !j + 1;
      end
  done;
  (* print_array temp; *)
  Array.for_all ((=) c) temp
;;
      

let check_diag_right board n c =
  let temp = Array.make n ' ' in
  let row = ref 0 in
  for i = 0 to (n * n - 1) do
    if (i mod (n + 1) = 0) then
      begin
        temp.(!row) <- board.(i);
        row := !row + 1;
      end
  done;
  (* print_array temp; *)
  Array.for_all ((=) c) temp
;;


let check_diag_left board n c =
  let temp = Array.make n ' ' in
  let row = ref 0 in
  for i = 0 to ((n * n) - 1) do
    if (i mod (n - 1) = 0 && (i != 0) && i != ((n * n) - 1)) then
       begin
         temp.(!row) <- board.(i);
         row := !row + 1;
       end
  done;
  (* print_array temp; *)
  Array.for_all ((=) c) temp
;;


let print_arr array_val =
  Printf.printf("%c ") array_val;;


let print_array array =
  Array.iter print_arr array;;


(* check whole board for winning user move *)
let check_for_win board n c =
  let win_check = ref false in
  for i = 0 to (n - 1) do
    begin
      if (check_row board i n c) then win_check := true;
      if (check_col board i n c) then win_check := true;
      if (check_diag_right board n c) then win_check := true;
      if (check_diag_left board n c) then win_check := true;
    end
  done;
  !win_check;;


(* below here, working on computer plays and checks *)

(* Logic for making moves is as follows:

   1) Do we need to make a winning move?
      a. this means we need to scan for our OWN (n - 1)
         contiguous connections.
 
   2) Do we need to make a blocking move? 
      a. this means we need to check board for any 
         opponent "connections" (i.e. contiguous 'X's 
         in the vertical, horizontal, or two diagonal
         directions) where the connection has (n - 1) 'X's.
      b. if yes, make the move.
 
   3) else, make a move that is next to a pre-existing 
      computer move.
      a. if no pre-existing moves exist, make a random
         move. 
 *)


let rec make_computer_move board n =
  print_string "computer, row: ";
  let row = read_int () in
  print_string "computer, col: ";
  let col = read_int () in
  let move = calculate_move row col n in
  if (player_move_validation move board) then
    board.(move) <- 'O'
  else
    begin
      print_string "Invalid move. Please try again.\n";
      make_computer_move board n;
    end
;;


let row_has_o board row n =
  let o_exists = ref false in
  for i = n * row to (n * row + (n - 1)) do
    if board.(i) = 'O' then
      o_exists := true;
  done;
  !o_exists;;


let check_row_for_block board row n =
  let make_block = ref false in
  let x_count = ref 0 in
  let start_point = row * n in
  let end_point = start_point + (n - 1) in
  for i = start_point to end_point do
    if board.(i) = 'X' then
      x_count := !x_count + 1;
  done;
  if (!x_count == (n - 1) && (row_has_o board row n) = false) then
    make_block := true;
  !make_block;;


let make_block_row board row n =
  let block_spot = ref 0 in
  for i = (row * n) to ((row * n) + (n - 1)) do
    if board.(i) = ' ' then
      block_spot := i;
  done;
  board.(!block_spot) <- 'O'
;;


let col_has_o board col n =
  let o_exists = ref false in
  let arr_index = ref 0 in
  for i = 0 to (n - 1) do
    arr_index := (i * n + col);
    if (board.(!arr_index) = 'O') then
      o_exists := true;
  done;
  !o_exists;;


(* i * n + col is col values *)
let check_col_for_block board col n =
  let make_block = ref false in
  let x_count = ref 0 in
  let arr_index = ref 0 in
  for i = 0 to (n - 1) do
    arr_index := (i * n + col);
    if (board.(!arr_index) = 'X') then
      x_count := !x_count + 1;
  done;
  if (!x_count == (n - 1) && (col_has_o board col n) = false) then
    make_block := true;
  !make_block;;


let make_block_col board col n =
  let block_spot = ref 0 in
  let arr_index = ref 0 in
  for i = 0 to (n - 1) do
    arr_index := (i * n + col);
    if (board.(!arr_index) = ' ') then
      block_spot := !arr_index;
  done;
  board.(!block_spot) <- 'O'
;;
         

let diagr_has_o board n =
  let temp = Array.make n ' ' in
  let row = ref 0 in
  for i = 0 to (n * n - 1) do
    if (i mod (n + 1) = 0) then
      begin
        temp.(!row) <- board.(i);
        row := !row + 1;
      end
  done;
  Array.exists ((=) 'O') temp
;;

let check_diagr_for_block board n =
  
  (* check for exactly n - 1 'X' chars and 
     exactly 0 'O' chars. this means there
     is exactly one ' ' char in diag AND
     the rest is 'x' 
   *)

  let make_block = ref false in
  let temp = Array.make n ' ' in
  let row = ref 0 in
  for i = 0 to (n * n - 1) do
    if (i mod (n + 1) = 0) then
      begin
        temp.(!row) <- board.(i);
        row := !row + 1;
      end
  done;
  let x_count = ref 0 in
  for i = 0 to n - 1 do
    if (temp.(i) = 'X') then
      x_count := !x_count + 1;
  done;
  if (!x_count == n - 1 && (diagr_has_o board n = false)) then
    make_block := true;
  !make_block
;;


let make_block_diagr board n =
  let block_spot = ref 0 in
  let arr_index = ref 0 in
  let j = ref 0 in
  for i = 0 to n - 1 do
    arr_index := (i * n + !j);
    j := !j + 1;
    if (board.(!arr_index) = ' ') then
      block_spot := !arr_index;
  done;
  board.(!block_spot) <- 'O'
;;
    

let diagl_has_o board n =
  let temp = Array.make n ' ' in
  let row = ref 0 in
  for i = 0 to (n * n - 1) do
    if (i mod (n - 1) = 0 && (i != 0) && (i != (n * n - 1))) then
      begin
        temp.(!row) <- board.(i);
        row := !row + 1;
      end
  done;
  Array.exists ((=) 'O') temp
;;


let check_diagl_for_block board n =
  let make_block = ref false in
  let temp = Array.make n ' ' in
  let row = ref 0 in
  for i = 0 to (n * n - 1) do
    if (i mod (n - 1) = 0 && (i != 0) && (i != (n * n - 1))) then
      begin
        temp.(!row) <- board.(i);
        row := !row + 1;
      end
  done;
  let x_count = ref 0 in
  for i = 0 to n - 1 do
    if (temp.(i) = 'X') then
      x_count := !x_count + 1;
  done;
  if (!x_count == n - 1 && (diagl_has_o board n = false)) then
    make_block := true;
  !make_block
;;

let make_block_diagl board n =
  let block_spot = ref 0 in
  let arr_index = ref 0 in
  let j = ref (n - 1) in
  for i = 0 to n - 1 do
    arr_index := (i * n + !j);
    j := !j - 1;
    if (board.(!arr_index) = ' ') then
      block_spot := !arr_index;
  done;
  board.(!block_spot) <- 'O'
;;


let check_computer_for_block board n =
  let block_check = ref false in
  for i = 0 to n - 1 do
    if ((check_row_for_block board i n) || (check_col_for_block board i n)
        || (check_diagr_for_block board n) || (check_diagl_for_block board n)) then
      block_check := true;
  done;
  !block_check
;;


let make_computer_block board n =
  let block_fun_num = ref 0 in
  let block_spot = ref 0 in
  for i = 0 to n - 1 do
    if (check_row_for_block board i n) then
      begin
        block_fun_num := 1;
        block_spot := (i);
      end;
    if (check_col_for_block board i n) then
      begin
        block_fun_num := 2;
        block_spot := (i);
      end;
    if check_diagr_for_block board n then
      begin
        block_fun_num := 3;
        block_spot := (i);
      end;
    if check_diagl_for_block board n then
      begin
        block_fun_num := 4;
        block_spot := (i);
      end;
  done;
  if (!block_fun_num == 1) then
    make_block_row board !block_spot n;
  if (!block_fun_num == 2) then
    make_block_col board !block_spot n;
  if (!block_fun_num == 3) then
    make_block_diagr board n;
  if (!block_fun_num == 4) then
    make_block_diagl board n;
;;


(* === CHECKS TO SEE IF COMPUTER CAN MAKE WINNING MOVE === *)
let row_has_x board row n =
  let x_exists = ref false in
  for i = n * row to ((n * row) + (n - 1)) do
    if (board.(i) = 'X') then
      x_exists := true;
  done;
  !x_exists
;;

let check_row_for_win board row n =
  let make_win = ref false in
  let o_count = ref 0 in
  let start_point = row * n in
  let end_point = start_point + (n - 1) in
  for i = start_point to end_point do
    if board.(i) = 'O' then
      o_count := !o_count + 1;
  done;
  if (!o_count == (n - 1) && (row_has_x board row n = false)) then
    make_win := true;
  !make_win
;;

let make_win_row board row n =
  let win_spot = ref 0 in
  for i = (row * n) to ((row * n) + (n - 1)) do
    win_spot := i;
  done;
  board.(!win_spot) <- 'O'
;;

            
let col_has_x board col n =
  let x_exists = ref false in
  let arr_index = ref 0 in
  for i = 0 to (n - 1) do
    arr_index := (i * n + col);
    if (board.(!arr_index) = 'X') then
      x_exists := true;
  done;
  !x_exists
;;

let check_col_for_win board col n =
  let make_win = ref false in
  let o_count = ref 0 in
  let arr_index = ref 0 in
  for i = 0 to (n - 1) do
    arr_index := (i * n + col);
    if (board.(!arr_index) = 'O') then
      o_count := !o_count + 1;
  done;
  if (!o_count == (n - 1) && (col_has_x board col n = false)) then
    make_win := true;
  !make_win
;;

let make_win_col board col n =
  let win_spot = ref 0 in
  let arr_index = ref 0 in
  for i = 0 to (n - 1) do
    arr_index := (i * n + col);
    if (board.(!arr_index) = ' ') then
      win_spot := !arr_index;
  done;
  board.(!win_spot) <- 'O'
;;


let diagr_has_x board n =
  let temp = Array.make n ' ' in
  let row = ref 0 in
  for i = 0 to (n * n - 1) do
    if (i mod (n + 1) = 0) then
      begin
        temp.(!row) <- board.(i);
        row := !row + 1;
      end
  done;
  Array.exists ((=) 'X') temp
;;

let check_diagr_for_win board n =
  let make_win = ref false in
  let temp = Array.make n ' ' in
  let row = ref 0 in
  for i = 0 to (n * n - 1) do
    if (i mod (n + 1) = 0) then
      begin
        temp.(!row) <- board.(i);
        row := !row + 1;
      end
  done;
  let o_count = ref 0 in
  for i = 0 to n - 1 do
    if (temp.(i) = 'O') then
      o_count := !o_count + 1;
  done;
  if (!o_count == n - 1 && (diagr_has_x board n = false)) then
    make_win := true;
  !make_win
;;


let make_win_diagr board n =
  let win_spot = ref 0 in
  let arr_index = ref 0 in
  let j = ref 0 in
  for i = 0 to n - 1 do
    arr_index := (i * n + !j);
    j := !j + 1;
    if (board.(!arr_index) = ' ') then
      win_spot := !arr_index;
  done;
  board.(!win_spot) <- 'O'
;;


let diagl_has_x board n =
  let temp = Array.make n ' ' in
  let row = ref 0 in
  for i = 0 to (n * n - 1) do
    if (i mod (n - 1) = 0 && (i != 0) && (i != (n * n - 1))) then
      begin
        temp.(!row) <- board.(i);
        row := !row + 1;
      end
  done;
  Array.exists ((=) 'X') temp
;;

let check_diagl_for_win board n =
  let make_win = ref false in
  let temp = Array.make n ' ' in
  let row = ref 0 in
  for i = 0 to (n * n - 1) do
    if (i mod (n - 1) = 0 && (i != 0) && (i != (n * n - 1))) then
      begin
        temp.(!row) <- board.(i);
        row := !row + 1;
      end
  done;
  let o_count = ref 0 in
  for i = 0 to n - 1 do
    if (temp.(i) = 'O') then
      o_count := !o_count + 1;
  done;
  if (!o_count == n - 1 && (diagl_has_x board n = false)) then
    make_win := true;
  !make_win
;;

let make_win_diagl board n =
  let win_spot = ref 0 in
  let arr_index = ref 0 in
  let j = ref (n - 1) in
  for i = 0 to n - 1 do
    arr_index := (i * n + !j);
    j := !j - 1;
    if (board.(!arr_index) = ' ') then
      win_spot := !arr_index;
  done;
  board.(!win_spot) <- 'O'
;;


(* this function has to be implemented after helper functions in 
   long if check are implemented *)
let check_computer_for_win_move board n =
  let win_check = ref false in
  for i = 0 to n - 1 do
    if ((check_row_for_win board i n) || (check_col_for_win board i n)
        || (check_diagr_for_win board n) || (check_diagl_for_win board n)) then
      win_check := true;
  done;
  !win_check
;;

(* looks for which win check was true, then makes winning move
   in appropriate win move function. 
   if win_fun_num == 1, make_win_row using appropriate row (from i) *)
let make_computer_win board n =
  let win_fun_num = ref 0 in
  let win_spot = ref 0 in
  for i = 0 to n - 1 do
    if (check_row_for_win board i n) then
      begin
        win_fun_num := 1;
        win_spot := (i);
      end;
    if (check_col_for_win board i n) then
      begin
        win_fun_num := 2;
        win_spot := (i);
      end;
    if check_diagr_for_win board n then
      begin
        win_fun_num := 3;
        win_spot := (i);
      end;
    if check_diagl_for_win board n then
      begin
        win_fun_num := 4;
        win_spot := (i);
      end;
  done;
  if (!win_fun_num == 1) then
    make_win_row board !win_spot n;
  if (!win_fun_num == 2) then
    make_win_col board !win_spot n;
  if (!win_fun_num == 3) then
    make_win_diagr board n;
  if (!win_fun_num == 4) then
    make_win_diagl board n;
;;
    

let board_not_full_check board n =
  Array.exists ((=) ' ') board
;;


let make_rand_move board n =
  let temp = Array.make (n * n) 0 in
  let empty_count = ref 0 in
  for i = 0 to (n * n - 1) do
    if board.(i) = ' ' then
      begin
        temp.(!empty_count) <- i; 
        empty_count := !empty_count + 1;
      end;
  done;
  let move = Random.int !empty_count in
  board.(temp.(move)) <- 'O'
;;


(* game structure and logic flow

   1) Declare rules. Player is always 'X'. Computer is 'O'.
   2) Get player move first, always. 
   3) Make computer move. 
      a. We have to make sure there are spaces left on the board
         --> board_not_full_check board n;;
         i. if false, print CAT'S GAME and exit. 
      b. We then see if we can make winning move.
         --> check_computer_for_win board n;;
      c. We then see if we can make a significant block
         --> check_computer_for_block board n;;
      d. If none of the other checks pass, we make random move 
         --> make_rand_move board n;;

   FINISH IMPLEMENTING MAIN WHILE LOOP!!!
refer to top of code for example on looping using ocaml 
recursion. 

 *) 




(*And then here is main: *)
let main () =
    let _ = print_string
          "Welcome to Tic-Tac-Toe Ocaml! Enter the size of the board: " in
    let n = read_int () in
    let board = initBoard n in
    
    get_player_move board n;
    main_loop board n (false)
;;


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
