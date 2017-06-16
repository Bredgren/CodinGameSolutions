# n: Number of elements which make up the association table.
read n
# q: Number q of file names to be analyzed.
read q

declare -A map

for (( i=0; i<n; i++ )); do
    read ext mt
    map["${ext,,}"]=$mt
done

for (( i=0; i<q; i++ )); do
    read fname
    base="${fname%.[^.]*}"
    ext="${fname:${#base} + 1}"
    mime=${map["${ext,,}"]}

    if [ -z "$mime" ]
    then
        echo "UNKNOWN"
    else
        echo "$mime"
    fi
done

# To debug: echo "Debug messages..." >&2

# Cool solution by someone else
# read n
# read q
#
# declare -A dict
# for((;i++<n;)){
#     read suffix mime
#     dict[.${suffix,,}]=$mime
# }
#
# sed 's/.*\././' | while read suffix
# do
#     mime=${dict[${suffix,,}]}
#     [[ -n "$mime" ]] && echo $mime || echo UNKNOWN
# done
