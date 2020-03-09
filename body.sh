input="../OrderNewregis01to0407.dat"
cd fileDat
while IFS= read -r line; do
    IFS=',' read -r -a array <<<"$line"

    u="${array[2]}"
    set -- $u
    empty=""
    date=$(echo "${1}" | sed "s/\//${empty}/g") #ตัดคำ
    time=$(echo "${2}" | sed "s/:/${empty}/g")
    timedate=$(echo "${2}00" | sed "s/:/${empty}/g")
    for l in ${array[7]}; do
        a=$(find D:/test/test_shell/pic | grep "$l") #รอที่ว่างไฟล์ Id card image
        IFS=":" read -ra b <<<"$a"
        c=$(find D:/test/test_shell/picc | grep "$l")   #URL image face
        IFS=":" read -ra d <<<"$a"
        e=$(find D:/test/test_shell/piccc | grep "$l")  #URL image Post
        IFS=":" read -ra f <<<"$a"
        echo "02|""0${array[7]}|""${array[0]}|""${array[1]}|""${b[1]}|""${d[1]}|""${f[1]}|""${b[1]}" \  >>sff_patch_url_img_mc""_$date""_$timedate.dat
    done

done <"$input"
