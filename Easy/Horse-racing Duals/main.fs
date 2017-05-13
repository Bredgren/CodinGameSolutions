open System

let strengths = List.sort [
    for i in 0..int(Console.In.ReadLine()) - 1 do
        yield int(Console.In.ReadLine())
]

printfn "%d" (List.fold2 (fun m a b -> if a - b < m then a - b else m) Int32.MaxValue strengths.Tail (strengths |> List.rev |> List.tail |> List.rev))

(* To debug: Console.Error.WriteLine("Debug message") *)

(* Cool solution by someone else
let R() = Console.ReadLine() |> int
Seq.init (R()) (fun _ -> R())		     // call fun R() times to create seq
|> Seq.sort
|> Seq.pairwise                      // creates a sequence of adjacent pairs
|> Seq.map (fun x -> snd x - fst x)  // for each pair subtract the larger from the smaller
|> Seq.min
|> printfn "%d"
*)
