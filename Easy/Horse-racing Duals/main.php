<?php

$strengths = [];
fscanf(STDIN, "%d", $N);
for ($i = 0; $i < $N; $i++) {
    fscanf(STDIN, "%d", $Pi);
    $strengths[] = $Pi;
}

sort($strengths);

$min = $strengths[1] - $strengths[0];
for ($i = 0; $i < $N - 1; $i++) {
    $d = $strengths[$i + 1] - $strengths[$i];
    if ($d < $min) {
        $min = $d;
    }
}

echo("$min\n");

// Write an action using echo(). DON'T FORGET THE TRAILING \n
// To debug (equivalent to var_dump): error_log(var_export($var, true));


/* Cool soution by someone else
<?php
//init
fscanf(STDIN, "%d",$N);
for ($i = 0; $i < $N; $i++){
    fscanf(STDIN, "%d",$Pi);
    $arr[]=$Pi;									// No need to declare before
}

sort($arr);
//get all diffs
for($i=1;$i<$N;$i++)$diff[]=abs($arr[$i]-$arr[$i-1]);
//send response
echo min($diff);
*/

/*
for ($i = 1; $i < $n; $i++)
    $data[$i-1] = $data[$i] - $data[$i-1];			// reuse data array
*/

/* My new soution would be
fscanf(STDIN, "%d", $N);
for ($i = 0; $i < $N; $i++) {
    fscanf(STDIN, "%d", $Pi);
    $strengths[] = $Pi;
}

sort($strengths);

for ($i = 1; $i < $N; $i++) {
    $strengths[$i-1] = $strengths[$i] - $strengths[$i-1];
}

echo min($strengths);
*/
