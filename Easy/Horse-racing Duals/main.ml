let rline () = (int_of_string (input_line stdin))

let rec read_n n =
    match n with
    | n when n <= 0 -> []
    | _ -> rline () :: read_n (n-1)
;;

(* List.map2 was hitting stack overflow and also doesn't allow different size lists *)
let rec map2 f l1 l2 =
    match f, l1, l2 with
    | _, [], [] -> []
    | _, [_], [] -> []
    | _, [], [_] -> []
    | _, l11::l1s, l21::l2s -> (f l11 l21) :: map2 f l1s l2s
;;

let strengths = List.sort compare (read_n (rline ())) in
let diffs = map2 (fun a b -> a - b) (List.tl strengths) strengths in
let m = List.fold_left min (List.hd diffs) diffs in
print_endline (string_of_int m);

(* To debug: prerr_endline "Debug message"; *)

(* Cool solution by someone else
let () =
    let n = read_int () in																														(* read_int, obvious better option if only I'd known*)
    let powers = Array.init n (fun _ -> read_int ()) in																(* Constructs array by calling the function n times*)
    Array.sort compare powers;																												(* I can use compare in one place in my solution so I updated it *)
    let diffs = Array.init (n - 1) (fun i -> abs @@ powers.(i) - powers.(i + 1)) in		(* @@ is like $ in Haskell I think *)
    let d = Array.fold_left min diffs.(0) diffs in																		(* I can use min so I updated my solution, instead (fun a b -> if a < b then a else b) in fold_left *)
    print_endline @@ string_of_int d
*)

(*
let n = read_int () in
let p = Array.init n (fun _ -> read_int ()) in
let mi = ref max_int in
Array.fast_sort compare p;
for i = 1 to n - 1 do
    mi := min !mi (p.(i) - p.(i-1))							(* Looks like ! updates a variable *)
done;

Printf.printf "%d\n%!" !mi;
*)
