program Answer;
{$H+}
uses sysutils, classes, math;

var
    N : Int32;
    Pi : Int32;
    i, j : Int32;
    Inputs: TStringList;
    strengths: array of Int32;
    min: Int32;

// Helper to read a line and split tokens
procedure ParseIn(Inputs: TStrings) ;
var Line : string;
begin
    readln(Line);
    Inputs.Clear;
    Inputs.Delimiter := ' ';
    Inputs.DelimitedText := Line;
end;

// http://rosettacode.org/wiki/Sorting_algorithms/Quicksort#Pascal
procedure QuickSort(left, right : Int32);
var
  i, j : Int32;
  tmp, pivot : Int32;
begin
  i := left;
  j := right;
  pivot := strengths[(left + right) shr 1];
  repeat
    while pivot > strengths[i] Do i := i+1;
    while pivot < strengths[j] Do j := j-1;
    if i <= j then begin
      tmp := strengths[i];
      strengths[i] := strengths[j];
      strengths[j] := tmp;
      j := j-1;
      i := i+1;
    end;
  until i>j;
  if left < j then QuickSort(left, j);
  if i < right then QuickSort(i, right);
end;

begin
    Inputs := TStringList.Create;
    ParseIn(Inputs);
    N := StrToInt(Inputs[0]);
    setLength(strengths, N);
    for i := 0 to N-1 do
    begin
        ParseIn(Inputs);
        Pi := StrToInt(Inputs[0]);
        strengths[i] := Pi;
    end;

    QuickSort(0, N-1);

    min := strengths[1] - strengths[0];
    writeln(StdErr, min);
    for i := 0 to N - 2 do begin
        j := strengths[i+1] - strengths[i];
        if j < min then begin
            min := j;
        end;
    end;

    writeln(min);
    flush(StdErr); flush(output); // DO NOT REMOVE
end.

// To debug: writeln(StdErr, 'Debug messages...');

{* Cool solution by someone else
program Answer;
{$H+}
uses sysutils, math, fgl;


function Compar(const a, b : Int32): Int32;
begin
    Compar := a - b;
end;


type
    vector = specialize TFPGList<Int32>; // All the magic is from this special list it seems
var
    N : Int32;
    P : vector;
    i, t : Int32;
    min_diff : Int32;
begin
    readln(N);

    P := vector.Create;
    for i := 1 to N do
    begin
        readln(t);
        P.Add(t);
    end;

    P.Sort(@Compar);

    min_diff := P[1] - P[0];
    for i := 1 to N-2 do
        min_diff := Min(min_diff, P[i+1] - P[i]);

    writeln(min_diff);
    flush(output);
end.
*}
