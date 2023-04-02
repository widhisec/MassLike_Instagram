#!/bin/bash
# powered by widhisec
# TOLONG YA HARGAI PEMBUAT NYA
# UPDATE 09/12/2022 
useragent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36"
############ COLORRRRRR ################
H=$(tput setaf 2)
M=$(tput setaf 1)
N=$(tput sgr0)
B=$(tput setaf 6)
Y=$(tput setaf 3)
########################################
############ encoding ##################
export LC_ALL=en_US.UTF-8
#######################################
############ TIME ######################
time=$(date +%s%N|cut -b1-13)
########################################
function login() {
	set -- *
	local SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)"
	#default='/data/data/com.termux/files/home/MassLike_Instagram'
	COOKIE_MY="$EMAIL.cookies"
	y="$SCRIPT_DIR/$COOKIE_MY"
	readarray -t files < <(compgen -G "$y")
	#find=$(find *.cookies -type f)
	if [[ ! -e $files ]];then
		printf "\n%s[+]%sLogining in..\n" "${H}" "${N}"
		local ambil=$(curl -D - "https://www.instagram.com/accounts/login/ajax/" -sL)
		local csrf=$(echo "$ambil" | grep -Po '(?<=csrftoken=)[^;]*')
		local mid=$(echo "$ambil"|grep -Po '(?<=mid=)[^;]*')
		local did=$(echo "$ambil"|grep -Po '(?<=ig_did=)[^;]*')
		local ses=$(echo "$ambil"|grep -Po '(?<=sessionid=)[^;]*')
		local login=$(curl -D - 'https://www.instagram.com/api/v1/web/accounts/login/ajax/' \
				-H 'origin: https://www.instagram.com' \
				-H 'x-requested-with: XMLHttpRequest' \
				-H "user-agent: $useragent" \
				-H "x-csrftoken: $csrf" \
				-H 'content-type: application/x-www-form-urlencoded' \
				-H 'accept: */*' \
			-H 'referer: https://www.instagram.com/accounts/login/' --data-urlencode "username=${EMAIL}" --data-urlencode "enc_password=#PWD_INSTAGRAM_BROWSER:0:${time}:${PASS}" --data-urlencode "optIntoOneTap=false" --compressed -sL)
		#local check=$(echo -e "$login" | grep -Po '(?<=checkpoint_url":")[^"]*')
		local usid=$(echo -e "$login" | grep -Po '(?<=userId":")[^"]*'|sort -u)
		local isauth=$(echo -e "$login" | grep -Po '(?<="authenticated":)[^,]*')		
		elif [[ $isauth =~ "true" ]]; then
		     echo "${login}" >> $EMAIL.cookies
		     echo "ID -> ${usid}"
		     gete	
	      else
		    rm -rf $EMAIL.cookies
		    #for i in "${files[@]}";do echo "Found -$i-";done
	       fi


}
function idd() {
    gaskan
	(curl -s "${URL}" --location -A "${useragent}" \
			-H 'accept-language: en-US,en;q=0.9' \
			-H 'x-requested-with: XMLHttpRequest' \
			-H "x-csrftoken: $csrf" \
			-H "cookie: mid=${id};ig_did=${did};rur=VLL; csrftoken=${csrf}; sessionid=${ses}" \
			-H 'content-type: application/x-www-form-urlencoded' \
		-H 'accept: */*' --compressed)|grep -Po '(?<="media_id":").*?(?=")'|sort -u 
}
function gaskan(){
	set -o pipefail
	Fruits=('csrftoken' 'ig_did' 'sessionid')
	Fruits[0]="csrftoken"
	Fruits[1]="ig_did"
	Fruits[2]="sessionid"
	z=$(/bin/true|echo "${Fruits[0]}")
	b=$(/bin/true|echo "${Fruits[1]}")
	p=$(/bin/true|echo "${Fruits[2]}")
	#mapfile -t oke < <(cat *.cookies)	
	#;echo $?
}
function open(){
	for URL in $(cat fot.txt); do
		idd
	done
}
function gete(){
	gaskan	
	 csrf=$(cat $EMAIL.cookies| grep -Po "(?<=$z=)[^;]*"|sort -u)
	 did=$(cat $EMAIL.cookies|grep -Po "(?<=$b=)[^;]*"|sort -u)
	 ses=$(cat $EMAIL.cookies|grep -Po "(?<=$p=)[^;]*"|sort -u)
	v=$(open)
	echo -e "$v" >> NAH.txt
	for ea in $(cat NAH.txt);do
		x=$(curl "https://www.instagram.com/web/likes/$ea/like/" \
				-X 'POST' \
				-H 'content-type: application/x-www-form-urlencoded' \
				-H 'accept: */*' \
				-H 'x-requested-with: XMLHttpRequest' \
				-H "user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36" \
				-H "x-csrftoken: $csrf" \
				-H "cookie: mid=${id};ig_did=${did};rur=VLL; csrftoken=${csrf}; ds_user_id=${usid}; sessionid=${ses}"  --compressed -sL
 		)
		TUSS=$(echo -e "$x" |grep -Po '(?<=status":")[^"]*')
		printf "%s[#]%s%s (mdaID) -> %s%s\n" "${H}" "${N}" "${TUSS}" "${ea}" "${N}"
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
declare -i nomor=1
jumlahlines=$(cat $USERmailist | cut -f1 -d' ')
declare -i hitung=0
IFS=$'\r\n' GLOBIGNORE='*' command eval 'bacot=($(cat $USERmailist))'
for (( i = 0; i <"${#bacot[@]}"; i++ )); do
	EMPAS="${bacot[$i]}"
	IFS='|' read -r -a array <<< "$EMPAS"
	EMAIL=${array[0]}
	PASS=${array[1]}
	NUMBER=$((nomor++))
	kamu=$(expr $hitung % 1)
	if (( $kamu == 0 || $hitung == 0 ));
	then
		sleep 1
	fi
	login $EMAIL $PASS $NUMBER &
	hitung=$(($hitung+1))
done
wait
