#!/bin/bash
# widhisec ~ ZSECC0DE-CREW-ID
# TOLONG YA HARGAI PEMBUAT NYA
# CREATE ON 20:06 SELESAI JAM 23:26
useragent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36"
############ COLORRRRRR ################
########################################
H=$(tput setaf 2)
M=$(tput setaf 1)
N=$(tput sgr0)
B=$(tput setaf 6)
Y=$(tput setaf 3)
time=$(date +%s%N|cut -b1-13)
function login() {
	      printf "\n${H}[+]${N}Logining in..\n"
        ambil=$(curl -D - 'https://www.instagram.com/accounts/login/' \
         -H "user-agent: $useragent" \
         -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8' \
         -H 'accept-encoding: gzip, deflate, br' \
         -H 'accept-language: en-US,en;q=0.9' --compressed -s)
         csrf=$(echo "$ambil" | grep -Po '(?<=csrftoken=)[^;]*')
         login=$(curl -D - 'https://www.instagram.com/accounts/login/ajax/' \
         -H 'origin: https://www.instagram.com' \
         -H 'x-requested-with: XMLHttpRequest' \
         -H "user-agent: $useragent" \
         -H "x-csrftoken: $csrf" \
         -H 'content-type: application/x-www-form-urlencoded' \
         -H 'accept: */*' \
         -H 'referer: https://www.instagram.com/accounts/login/' --data-urlencode "username=${1}" --data-urlencode "enc_password=#PWD_INSTAGRAM_BROWSER:0:${time}:${2}" --data-urlencode "optIntoOneTap=false" --compressed -sL)     
        check=$(echo -e "$login" | grep -Po '(?<=checkpoint_url":")[^"]*')
        usid=$(echo -e "$login" | grep -Po '(?<=userId":")[^"]*')
        isauth=$(echo -e "$login" | grep -Po '(?<="authenticated":)[^,]*')
        session=$(echo -e "$login" | grep -Po '(?<=sessionid=)[^;]*')
	err=$(echo -e "$login" |grep -Po '(?<=message":")[^"]*')
        if [[ $isauth =~ "true" ]];then
            printf "${H}[+]${N}Login Success..\n"
            printf "${H}[+]${N}User ID : $usid\n"
        else
	echo  $err
            printf "[-]${M}GAGAL LOGIN]${N}\n"
        fi
}
function idd() { 
	    curl -s "${URL}" --location -A "${useragent}" \
	    -H 'accept-language: en-US,en;q=0.9' \
        -H 'x-requested-with: XMLHttpRequest' \
        -H "cookie: csrftoken=$csrf" \
        -H "x-csrftoken: $csrf" \
        -H "x-instagram-ajax: $rolout" \
        -H 'content-type: application/x-www-form-urlencoded' \
        -H 'accept: */*' --compressed|
        grep 'instagram://media?id=' | grep -oP 'id=\K.*(?=")'
}
function open(){
          for URL in $(cat fot.txt); do
              idd
          done
}
function gete(){
      v=$(open)
       echo -e "$v" >> NAH.txt
       for ea in $(cat NAH.txt);do
       x=$(curl -s "https://www.instagram.com/web/likes/$ea/like/" -X 'POST' \
           -H 'origin: https://www.instagram.com' \
           -A "${useragent}" \
           -H 'accept-language: en-US,en;q=0.9' \
           -H 'x-requested-with: XMLHttpRequest' \
           -H "csrftoken=$csrf" \
           -H "x-csrftoken: $csrf" \
           -H 'content-type: application/x-www-form-urlencoded' --compressed -L)
        status=$(echo -e "$x" | grep -Po '(?<=status": ")[^"]*')
                 printf "${H}[#]${N}$status (mdaID) -> $ea${N}\n"
    done
    rm -rf NAH.txt
}
echo -e "
${N}create by - ( ${B}widhisec )
________________________
┌─┐┬ ┬┌┬┐┌─┐┬  ┬┬┌─┬┌─┐ |
${Y}├─┤│ │ │ │ ││  │├┴┐││ ┬ | ${N}for instagram
┴ ┴└─┘ ┴ └─┘┴─┘┴┴ ┴┴└─┘ |
-------------------------
"
ls
echo -e '-------------------------------------------'
echo -e "${N}[${M}(!)${N}] ${N}LOGIN DULU BRO..."
echo "Delimeter list -> email|password"
echo -n "Masukan File List : "
read USERmailist;
nomor=1
jumlahlines=$(cat $USERmailist | wc -l | cut -f1 -d' ')
hitung=0
IFS=$'\r\n' GLOBIGNORE='*' command eval 'bacot=($(cat $USERmailist))'
waktumulai=$(date +%s)
for (( i = 0; i <"${#bacot[@]}"; i++ )); do
EMPAS="${bacot[$i]}"
IFS='|' read -r -a array <<< "$EMPAS"
EMAIL=${array[0]}
PASS=${array[1]}
number=$((nomor++))
kamu=$(expr $hitung % 1)
if [[ $kamu == 0 && $hitung > 0 ]]; then
sleep 1
fi
login $EMAIL $PASS $penambahan $number
gete &
hitung=$[$hitung+1]
done
wait
