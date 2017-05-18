readline() { read line; echo ${line//,/.}; }

lon=$(readline)
lat=$(readline)
n=$(readline)
for (( i=0; i<n; i++ )); do
    defib=$(readline)
    IFS=";"; split=($defib); unset IFS;
    names[i]=${split[1]}
    lons[i]=${split[4]}
    lats[i]=${split[5]}
done

# 1=lonA, 2=latA, 3=lonB, 4=latB
distance() { echo $(awk "BEGIN{
    x = ($3 - $1) * cos(($2 + $4) / 2)
    y = ($4 - $2)
    print sqrt(x^2 + y^2) * 6371
}"); }

cmp() { echo $(awk "BEGIN{ print int($1 - $2) }"); }

name=""
dist=0
for (( i=0; i<n; i++ )) do
    d=$(distance $lon $lat ${lons[i]} ${lats[i]})
    if [ -z "$name" ] || [ "$(cmp $d $dist)" -lt 0 ]
    then
        dist=$d
        name=${names[i]}
    fi
done

echo $name

# To debug: echo "Debug messages..." >&2

# Cool solution by someone else
# distance() {
#     x=$(echo "($3 - $1) * c(($2 + $4) / 2)" | bc -l)				# I can use bc for math instead of awk it seems
#     y=$(echo "$4 - $2" | bc -l)
#     echo $(echo "sqrt($x * $x + $y * $y) * 6371" | bc -l)
# }
#
# read LON
# LON=${LON/,/.}
# read LAT
# LAT=${LAT/,/.}
# read N
#
# dist=999999999
#
# for (( i=0; i<N; i++ )); do
#     IFS=';' read NUM NAME ADDR PH D_LON D_LAT
#     D_LON=${D_LON/,/.}
#     D_LAT=${D_LAT/,/.}
#     thisDistance=$(distance $LON $LAT $D_LON $D_LAT)
#     if [ $(echo "$thisDistance < $dist" | bc -l) -eq 1 ]; then
#         dist=$thisDistance
#         closest=$NAME
#     fi
# done
#
# echo $closest
