read message

currentDigit=0
count=0
for (( i=0; i<${#message}; i++ )); do
    char="${message:$i:1}"
    binary=$(echo -n "$char" | xxd -b | awk '{print $2}')
    binary=${binary/0/}
    for (( j=0; j<${#binary}; j++ )); do
        digit="${binary:$j:1}"
        if [ "$currentDigit" -ne "$digit" ]; then
            if [ "$count" -gt 0 ]; then
                if [ "$currentDigit" -eq 0 ]; then
                    echo -n "00"
                else
                    echo -n "0"
                fi
                echo -n " "
                for n in `seq $count`; do
                    echo -n "0"
                done
                echo -n " "
            fi

            currentDigit=$digit
            count=1
        else
            count=$((count + 1))
        fi
    done
done

if [ "$count" -gt 0 ]; then
    if [ "$currentDigit" -eq 0 ]; then
        echo -n "00"
    else
        echo -n "0"
    fi
    echo -n " "
    for n in `seq $count`; do
        echo -n "0"
    done
fi

# To debug: echo "Debug messages..." >&2
