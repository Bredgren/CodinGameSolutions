let pi = 4.0 *. atan 1.0

let convertNum st = (float_of_string @@ String.map (fun s -> if s == ',' then '.' else s) st) /. 180.0 *. pi

let rec split str =
    if String.contains str ';' then let i = String.index str ';' in
    String.sub str 0 i :: (split @@ String.sub str (i + 1) ((String.length str) - i - 1))
    else [str]
;;

let lon = convertNum (input_line stdin) in
let lat = convertNum (input_line stdin) in
let distance lonB latB =
    let x = (lonB -. lon) *. (cos ((lat +. latB) /. 2.0)) in
    let y = latB -. lat in
    sqrt (x *. x +. y *. y) *. 6371.0
in

let nameDist tokens = (List.nth tokens 1, distance (convertNum (List.nth tokens 4)) (convertNum (List.nth tokens 5))) in

print_endline (Array.init (read_int ()) (fun _ -> (input_line stdin)) |>
Array.map (fun i -> nameDist @@ split i) |>
Array.fold_left (fun a b -> if (snd b) < (snd a) then b else a) ("", 999999999.0) |>
fst);

(* To debug: prerr_endline "Debug message"; *)
