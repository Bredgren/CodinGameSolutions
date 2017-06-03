program Answer;
{$H+}
uses sysutils, classes, math;

// Helper to read a line and split tokens
procedure ParseIn(Inputs: TStrings) ;
var Line : string;
begin
    readln(Line);
    Inputs.Clear;
    Inputs.Delimiter := ' ';
    Inputs.DelimitedText := Line;
end;

function ConvertNum(str: String): Extended;
begin
    ConvertNum := StrToFloat(StringReplace(str, ',', '.', [])) / 180 * pi;
end;

procedure Split(str: String; out: TStrings);
begin
    out.Clear;
    out.Delimiter := ';';
    out.StrictDelimiter := True;
    out.DelimitedText := str;
end;

function Distance(lonA, latA, lonB, latB: Extended): Extended;
var x, y: Extended;
begin
    x := (lonB - lonA) * cos((latA + latB) / 2);
    y := latB - latA;
    Distance := sqrt(x*x + y*y) * 6371;
end;

var
    lonA : Extended;
    latA : Extended;
    lonB : Extended;
    latB : Extended;
    n : Int32;
    defib : String;
    i : Int32;
    Inputs: TStringList;
    tokens: TStringList;
    dist: Extended;
    minDist: Extended;
    ans: String;
begin
    Inputs := TStringList.Create;
    tokens := TStringList.Create;
    ParseIn(Inputs);
    lonA := ConvertNum(Inputs[0]);
    ParseIn(Inputs);
    latA := ConvertNum(Inputs[0]);
    ParseIn(Inputs);
    n := StrToInt(Inputs[0]);
    for i := 0 to N-1 do
    begin
        readln(defib);
        Split(defib, tokens);
        lonB := ConvertNum(tokens[4]);
        latB := ConvertNum(tokens[5]);
        dist := Distance(lonA, latA, lonB, latB);
        if ((ans = '') or (dist < minDist)) then
        begin
            minDist := dist;
            ans := tokens[1];
        end;
    end;

    writeln(ans);
    flush(StdErr); flush(output); // DO NOT REMOVE

    // To debug: writeln(StdErr, 'Debug messages...');
end.

{* Cool solution by someone else
function StrToRad(STR : string) : Real;
begin
    DecimalSeparator := ',';
    StrToRad := DegToRad(StrToFloat(STR));
end;

function distance(lon1, lat1, lon2, lat2 : Real) : Real;
var
    dx, dy : Real;
begin
    dx := (lon2 - lon1) * cos(0.5 * (lat1 + lat2));
    dy := lat2 - lat1;
    distance := sqrt(SQR(dx) + SQR(dy)) * 6371.0;
end;


var
    Line : String;
    LON1, LON2 : Real;
    LAT1, LAT2 : Real;
    N : Int32;
    i : Int32;
    best_name : string;
    best_dist, dist : Real;
begin
    ReadLn(Line); LON1 := StrToRad(Line);
    ReadLn(Line); LAT1 := StrToRad(Line);
    ReadLn(N);

    best_dist := 1.0 / 0.0;
    for i := 1 to N do
    begin
        readln(Line);
        LON2 := StrToRad(ExtractDelimited(5, Line, [';']));
        LAT2 := StrToRad(ExtractDelimited(6, Line, [';']));
        dist := distance(LON1, LAT1, LON2, LAT2);
        if dist < best_dist then
        begin
            best_name := ExtractDelimited(2, Line, [';']);
            best_dist := dist;
        end;
    end;

    WriteLn(best_name);
    flush(output);
end.
*}
