#!/bin/bash
# widhisec ~ ZSECC0DE-CREW-ID
# TOLONG YA HARGAI PEMBUAT NYA
# CREATE ON 20:06 SELESAI JAM 23:26
useragent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36"
############ COLORRRRRR ################
H=$(tput setaf 2)
M=$(tput setaf 1)
N=$(tput sgr0)
B=$(tput setaf 6)
Y=$(tput setaf 3)
########################################
script_name=$0
############ encoding ##################
export LC_ALL=en_US.UTF-8
#######################################

############ TIME ######################
time=$(date +%s%N|cut -b1-13)
########################################
function log() {
    function logline() {
        colorprint $1 "[$script_name] $2: $3"
    }
}
function random(){
               OLDIFS=$IFS
               IFS=$(echo -en "\n\b")
               create="akun.txt"
               for file in $(awk 'END {print NR}' $create)
               do
                   randomNumber=$(($RANDOM*$file))
               done
               IFS=$OLDIFS
}
function login() {
         find=$(find *.cookies -type f)
         if ! [[ -e "$find" ]]; then
            random
            printf "\n${H}[+]${N}Logining in..\n"
            local ambil=$(curl -D - 'https://www.instagram.com/accounts/login/' \
                  -H "user-agent: $useragent" \
                  -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8' \
                  -H 'accept-encoding: gzip, deflate, br' \
                  -H 'accept-language: en-US,en;q=0.9' --compressed -sL)
            local csrf=$(echo "$ambil" | grep -Po '(?<=csrftoken=)[^;]*')
            local mid=$(echo "$ambil"|grep -Po '(?<=mid=)[^;]*')
            local did=$(echo "$ambil"|grep -Po '(?<=ig_did=)[^;]*')
            local ses=$(echo "$ambil"|grep -Po '(?<=sessionid=)[^;]*')
            login=$(curl -D - 'https://www.instagram.com/accounts/login/ajax/' \
                   -H 'origin: https://www.instagram.com' \
                   -H 'x-requested-with: XMLHttpRequest' \
                   -H "user-agent: $useragent" \
                   -H "x-csrftoken: $csrf" \
                   -H 'content-type: application/x-www-form-urlencoded' \
                   -H 'accept: */*' \
                   -H 'referer: https://www.instagram.com/accounts/login/' --data-urlencode "username=${1}" --data-urlencode "enc_password=#PWD_INSTAGRAM_BROWSER:0:${time}:${2}" --data-urlencode "optIntoOneTap=false" --compressed -sL)     
        local check=$(echo -e "$login" | grep -Po '(?<=checkpoint_url":")[^"]*')
        local usid=$(echo -e "$login" | grep -Po '(?<=userId":")[^"]*'|sort -u)
        local isauth=$(echo -e "$login" | grep -Po '(?<="authenticated":)[^,]*')
        local session=$(echo -e "$login" | grep -Po '(?<=sessionid=)[^;]*')
        echo "${login}" >> $randomNumber.cookies
    else
        gete
            
        fi
	      
        
}
function idd() { 
	    (curl -s "${URL}" --location -A "${useragent}" \
	    -H 'accept-language: en-US,en;q=0.9' \
            -H 'x-requested-with: XMLHttpRequest' \
            -H "cookie: csrftoken=$csrf" \
            -H "x-csrftoken: $csrf" \
            -H "x-instagram-ajax: $rolout" \
            -H 'content-type: application/x-www-form-urlencoded' \
            -H 'accept: */*' --compressed)|grep -Po '(?<=__typename":"GraphImage","id":").*?(?=")'|sort -u
}
function oke(){
          Fruits=('csrftoken' 'ig_did' 'sessionid')
          Fruits[0]="csrftoken"
          Fruits[1]="ig_did"
          Fruits[2]="sessionid"
          find=$(find *.cookies -type f)
         for i in "${find[@]}"; do
           local x=$(echo "${Fruits[0]}")
           local b=$(echo "${Fruits[1]}")
           local p=$(echo "${Fruits[2]}")
           local c=$(cat $i|grep -Po "(?<=$x=)[^;]*")
           local d=$(cat $i|grep -Po "(?<=$b=)[^;]*")
           local s=$(cat $i|grep -Po "(?<=$p=)[^;]*")
           for haha in $c;do echo $haha;done
         done
}
function open(){
          for URL in $(cat fot.txt); do
              idd
          done
}
function gete(){
  oke
   csrf=$(cat 6071.cookies| grep -Po '(?<=csrftoken=)[^;]*')
 did=$(cat 6071.cookies|grep -Po '(?<=ig_did=)[^;]*')
 ses=$(cat 6071.cookies|grep -Po '(?<=sessionid=)[^;]*')
      v=$(open)
       echo -e "$v" >> NAH.txt
       for ea in $(cat NAH.txt);do
           x=$(curl "https://www.instagram.com/web/likes/${ea}/like/" \
  -X 'POST' \
  -H 'content-type: application/x-www-form-urlencoded' \
  -H 'accept: */*' \
  -H 'x-requested-with: XMLHttpRequest' \
  -H "user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36" \
  -H "x-csrftoken: $csrf" \
  -H "cookie: mid=${id};ig_did=${did};rur=VLL; csrftoken=${csrf}; ds_user_id=${usid}; sessionid=${ses}" --compressed -s
)
        status=$(echo -e "$x" |grep -Po '(?<=status":")[^"]*')
                 printf "${H}[#]${N}$status (mdaID) -> $ea${N}\n"
    done
    rm -rf NAH.txt
}
function colorprint() {
    echo -e "\033[$1m$2\033[0m" 
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
NUMBER=$((nomor++))
kamu=$(expr $hitung % 1)
if [[ $kamu == 0 && $hitung > 0 ]]; then
sleep 1
fi
login $EMAIL $PASS $NUMBER &
hitung=$[$hitung+1]
done
wait

