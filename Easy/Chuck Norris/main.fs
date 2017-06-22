open System
open System.Text.RegularExpressions

let message = Console.In.ReadLine()

let toBinary i = Convert.ToString(int i, 2).PadLeft(7, '0')

let bits = String.Join("", List.map toBinary (List.ofSeq message))

let matchHandler m =
    let s = m.ToString()
    if s.StartsWith("1") then "0 " + Regex.Replace(s, "1", "0") + " "
    else "00 " + s + " "

Console.WriteLine(Regex.Replace(bits, "0+|1+", matchHandler).Trim())

(* To debug: Console.Error.WriteLine("Debug message") *)


(* Cool solution by someone else
open System
open System.Text.RegularExpressions

let MESSAGE = Console.In.ReadLine()

let parse i =
    let result =
        i |> Seq.map(fun x -> Convert.ToString((byte)x, 2))
        |> Seq.map(fun x -> x.PadLeft(7, '0'))
        |> String.concat String.Empty
    let result =
        Regex.Replace(result, @"(0)+", "00 $0 ")
    let result =
        Regex.Replace(result, @"(1)+", "0 $0 ")
    let result =
        result.Replace("1", "0")
    result

let t = parse MESSAGE

(* Write an action using printfn *)
(* To debug: Console.Error.WriteLine("Debug message") *)

printfn "%s" <| t.Substring(0, t.Length - 1)*)
