# READ
filename='../generated-path-name.txt'
cd fileDat

while read name; do
    merged_path="./$name"
    echo merged_path
    count=0
    while IFS= read -r line; do
        echo "$line" | grep "02|"
        count=$((count + 1))
    done <"$merged_path"
    result=$(expr $count - 1)
    echo "09|$result" \  >>$name
done <$filename
printf "Merged Path!"