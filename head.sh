input="../OrderNewregis01to0407.dat"
mkdir fileDat
cd fileDat
while IFS= read -r line; do
   IFS=',' read -r -a array <<<"$line"
   u="${array[2]}"
   set -- $u
   empty=""
   date=$(echo "${1}" | sed "s/\//${empty}/g") #ตัดคำ
   time=$(echo "${2}" | sed "s/:/${empty}/g")
   timedate=$(echo "${2}00" | sed "s/:/${empty}/g")
   echo "01|sff_patch_url_img_mc""_$date""_$timedate"".dat" \  > sff_patch_url_img_mc""_$date""_$timedate.dat

done <"$input"
