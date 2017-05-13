read N
for (( i=0; i<N; i++ )); do
    read strengths[i]
done

IFS=$'\n' strengths=($(sort -n <<<"${strengths[*]}")); unset IFS

#cat > diff.py << EOF
##!/usr/bin/env python
#l = [ int( i ) for i in "${strengths[*]}".split() ]
#print min( l[i+1] - l[i] for i in range(len(l)-1) )
#EOF

#echo $(python diff.py)

# Using python feels dirty, but had trouble making this fast enough
min=$((strengths[1] - strengths[0]))
for (( i=0; i<N-1; i++ )); do
    a=${strengths[i]}
    b=${strengths[i+1]}
    d=$((b - a))
    # Using this instead is too slow?
    #d=$((strengths[i+1] - strengths[i]))
    if [ $d -lt $min ]; then
        min=$d
    fi
done

echo $min
