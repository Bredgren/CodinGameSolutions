open System

let convertNum (s: string) = float(s.Replace(",", ".")) / 180.0 * Math.PI
let distance (lonA: float, latA: float, lonB: float, latB: float) =
    let x = (lonB - lonA) * Math.Cos((latA + latB) / 2.0)
    let y = latB - latA
    Math.Sqrt(x*x + y*y) * 6371.0

let lon = convertNum(Console.In.ReadLine())
let lat = convertNum(Console.In.ReadLine())
let n = int(Console.In.ReadLine())
[ for i in 0 .. n - 1 do
    let defib = Console.In.ReadLine().Split [| ';' |]
    let lonB = convertNum(defib.[4])
    let latB = convertNum(defib.[5])
    yield (defib.[1], distance(lon, lat, lonB, latB)) ]
|> List.minBy snd
|> Console.WriteLine

(* To debug: Console.Error.WriteLine("Debug message") *)

(* Cool solutions by others
open System

let input() = Console.In.ReadLine()

let toFloat (s:String) = s.Replace(',', '.') |> float

let distance lon1 lat1 lon2 lat2 =
    let x = (lon2 - lon1) * cos((lat1 + lat2) / 2.);
    let y = lat2 - lat1;
    sqrt(x * x + y * y) * 6371.;

let readDefib lon lat =
    let d = input().Split ';'
    (d.[1], distance lon lat (d.[4] |> toFloat) (d.[5] |> toFloat))

let LON = input() |> toFloat
let LAT = input() |> toFloat

Seq.init (input() |> int) (fun _ -> readDefib LON LAT)
|> Seq.minBy snd
|> fst
|> printfn "%s"
*)
