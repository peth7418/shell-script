# READ
filename='../generated-path-name.txt'
cd fileDat
while read name; do
    gen_path="./$name"
    echo gen_path
            x=`tail -n 1 $gen_path` 
            IFS="|" read -ra  fileDat <<< "$x"
            # echo ${fileDat[1]}
            IFS="/" read -ra  filepath <<< "$gen_path"
            # echo "${filepath[1]}|${fileDat[1]}" >> 12345.txt
            IFS="." read -ra  fullpath <<< "${filepath[1]}"
            echo "${fullpath[0]}|${fileDat[1]}" >> ${fullpath[0]}.sync

done <$filename
printf "Path!"
