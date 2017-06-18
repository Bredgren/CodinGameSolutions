open System
open System.Collections.Generic
open System.IO

let numElems = int(Console.In.ReadLine())
let numFiles = int(Console.In.ReadLine())

let table = new Dictionary<string, string>()

for i in 0 .. numElems - 1 do
    let token = (Console.In.ReadLine()).Split [|' '|]
    table.Add(token.[0].ToLower(), token.[1])
    ()

let getExt fname =
    let ext = Path.GetExtension(fname)
    if (ext <> null && ext.Length > 0) then ext.Substring(1) else ""

for i in 0 .. numFiles - 1 do
    let fname = Console.In.ReadLine().ToLower()
    let ext = getExt fname
    let mime = if (ext <> "" && table.ContainsKey(ext)) then table.Item(ext) else "UNKNOWN"
    Console.WriteLine mime
    ()

(* To debug: Console.Error.WriteLine("Debug message") *)

(* Cool solution by someone else
open System
open System.IO

let readLine _ = Console.In.ReadLine()
let readInt = readLine >> int

let mimeTypesCount = readInt()
let fileNamesCount = readInt()

let readMimeType _ =
    let [| extension; mimeType |] = readLine().Split()
    "." + extension.ToLower(), mimeType

let mimeTypes =
    Seq.init mimeTypesCount readMimeType
    |> Map.ofSeq

let printMimeType extension =
    match mimeTypes.TryFind extension with
    | Some mimeType -> printfn "%s" mimeType
    | None -> printfn "UNKNOWN"

Seq.init fileNamesCount readLine
|> Seq.map Path.GetExtension
|> Seq.map (fun extension -> extension.ToLower())
|> Seq.iter printMimeType
*)
