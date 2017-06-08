<?php

function convertNum($str) {
    return deg2rad(str_replace(",", ".", $str));
}

function distance($lonA, $latA, $lonB, $latB) {
    $x = ($lonB - $lonA) * cos(($latA + $latB) / 2);
    $y = $latB - $latA;
    return sqrt($x*$x + $y*$y) * 6371;
}

fscanf(STDIN, "%s", $lon);
fscanf(STDIN, "%s", $lat);

$lonA = convertNum($lon);
$latA = convertNum($lat);

$minDist = 0;
$answer = "";

fscanf(STDIN, "%d", $n);
for ($i = 0; $i < $n; $i++) {
    $defib = stream_get_line(STDIN, 256 + 1, "\n");
    $tokens = explode(";", $defib);
    $lonB = convertNum($tokens[4]);
    $latB = convertNum($tokens[5]);
    $dist = distance($lonA, $latA, $lonB, $latB);
    if ($answer == "" || $dist < $minDist) {
        $minDist = $dist;
        $answer = $tokens[1];
    }
}

echo("$answer\n");
// To debug (equivalent to var_dump): error_log(var_export($var, true));
?>
