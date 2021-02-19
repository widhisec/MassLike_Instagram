#!/bin/bash
# widhisec ~ ZSECC0DE-CREW-ID
# TOLONG YA HARGAI PEMBUAT NYA
# CREATE ON 20:06 SELESAI JAM 23:26
useragent="Mozilla/5.0 (Linux; Android 7.0; PLUS Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.98 Mobile Safari/537.36"
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
        ambil=$(curl -D - 'https://www.instagram.com/accounts/login/' -A "${useragent}" \
        -H 'origin: https://www.instagram.com' \
        -H 'authority: www.instagram.com' \
        -H 'upgrade-insecure-requests: 1' \
        -H 'accept-language: en-US,en;q=0.9' --compressed --silent)
        csrf=$(echo -e "$ambil" | grep -Po '(?<=csrftoken=)[^;]*')
        login=$(curl -X POST "https://www.instagram.com/accounts/login/ajax/" \
        -H 'Content-Type: application/x-www-form-urlencoded' \
        -H "Cookie: csrftoken=${csrf}" \
        -H 'referer: https://www.instagram.com/accounts/login/' \
        -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36' \
        -H "x-csrftoken: ${csrf}" \
        -H 'x-requested-with: XMLHttpRequest' --data-urlencode "username=${1}" --data-urlencode "enc_password=#PWD_INSTAGRAM_BROWSER:0:${time}:${2}" --data-urlencode "optIntoOneTap=false" --compressed -s)     
        check=$(echo -e "$login" | grep -Po '(?<=checkpoint_url":")[^"]*')
        usid=$(echo -e "$login" | grep -Po '(?<=userId":")[^"]*')
        isauth=$(echo -e "$login" | grep -Po '(?<="authenticated":)[^,]*')
        session=$(echo -e "$login" | grep -Po '(?<=sessionid=)[^;]*')
        if [[ $isauth =~ "true" ]];then
            printf "${H}[+]${N}Login Success..\n"
            printf "${H}[+]${N}User ID : $usid\n"
        else
            printf "[-]{M}GAGAL LOGIN]{$\n"
        fi
}
function idd() { 
	    curl -s "${URL}" --location -A "${useragent}" \
	    -H 'accept-language: en-US,en;q=0.9' \
        -H 'x-requested-with: XMLHttpRequest' \
        -H "cookie: mcd=$mcd; csrftoken=$csrf; ds_user_id=$usid; sessionid=$session; rur=$rur" \
        -H "x-csrftoken: $csrf" \
        -H "x-instagram-ajax: $rolout" \
        -H 'content-type: application/x-www-form-urlencoded' \
        -H 'accept: */*' -H 'authority: www.instagram.com' -H 'content-length: 0' --compressed|
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
       x=$(curl -s "https://www.instagram.com/web/likes/$ea/like/" -X POST \
           -H 'origin: https://www.instagram.com' \
           -A "${useragent}" \
           -H 'accept-language: en-US,en;q=0.9' \
           -H 'x-requested-with: XMLHttpRequest' \
           -H "cookie: mcd=$mcd; csrftoken=$csrf; ds_user_id=$usid; sessionid=$session; -H "x-csrftoken: $csrf" -H 'content-type: application/x-www-form-urlencoded' -H 'accept: */*' -H 'authority: www.instagram.com' -H 'content-length: 0' --compressed)
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
login $1 $2 $penambahan $number
gete &
hitung=$[$hitung+1]
done
wait
