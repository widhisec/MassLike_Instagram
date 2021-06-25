#!/bin/bash
# WIDHI$EC
# TOLONG YA HARGAI PEMBUAT NYA
# CREATE ON 20:06 SELESAI JAM 23:26
# BISA DI UBAH TAPI ADA TERJADI KESALAHAN ERORR TANGGUNG
# JAWAB SENDIRI YA BUKAN SALAH SAYA LAGIAN TERIMA KASIH SUDAH
# MENCOBA JANGAN LUPA BAGIKAN KESEMUA ORANG AGAR TAHU..
# MEMANG SEDIKIT TAPI MENCARINYA TIDAK SEMUDAH DI BAYANGKAN KALIAN KIRA
# HARAP MENGERTI JANGAN LUPA KASIH STAR MALAH LIHAT DOANG MASA GAK
# DI KASIH KASIAN SAYA DONG WKWK SEIKLAS NYA AJA YA HEHE
# <3
useragent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36"
# consumed. Consider having the pipefail option
# silence this warning
set -o pipefail
unset INDONESIA
unset APP_ID
unset CREATE
: "${CREATE}"
: "${INDONESIA}"
: "${APP_ID}"
# ganti hasil menjadi bahasa
INDONESIA=("id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7")
APP_ID=("936619743392459")
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
#SECONDS SINCE NANOSECONDS WITH ZEROS
############ TIME ######################
WAKTU=$(date +%s%N|cut -b1-13)
########################################
trap '' 2
echo "This is a test.
Hit [Ctrl+C] to test it..."
sleep 5
trap 2
function rAnDoM_HeRe(){
	OLDIFS=$IFS
	IFS=$(echo -en "\n\b")
	CREATE=("akun.txt")
	while read -r CREATE
	do
		randomNumber=$(($RANDOM))
	done <<<  "$(awk 'END {print NR}' "$CREATE")"
	IFS=$OLDIFS
}
function login() {
	set -- *
	local SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)"
	declare -i SCRIPT_DIR
	#default='/data/data/com.termux/files/home/MassLike_Instagram'
	COOKIE_MY='*.cookies'
	local y=$(/bin/true|echo "$SCRIPT_DIR/$COOKIE_MY")
	readarray -t FILES_MY < <(compgen -G "$y")
	#find=$(find *.cookies -type f)
	if [[ ! -e  "${FILES_MY[0]}" ]];then
		rAnDoM_HeRe
		printf "\n%s[+]%sLogining in..\n" "${H}" "${N}"
		local ambil=$(curl -D - 'https://www.instagram.com/accounts/login/' \
				-H "user-agent: $useragent" \
				-H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8' \
				-H 'accept-encoding: gzip, deflate, br' \
			        -H "accept-language: ${INDONESIA}" --compressed -sL)
		local csrf=$(echo "$ambil" | grep -Po '(?<="csrf_token":").*?(?=")')
		local mid=$(echo "$ambil"|grep -Po '(?<=mid=)[^;]*')
		local did=$(echo "$ambil"|grep -Po '(?<=ig_did=)[^;]*')
		local ses=$(echo "$ambil"|grep -Po '(?<=sessionid=)[^;]*')
		local login=$(curl 'https://www.instagram.com/accounts/login/ajax/' -sS \
				-X 'POST' \
				-H 'authority: www.instagram.com' \
				-H 'content-type: application/x-www-form-urlencoded' \
				-H 'accept: */*' \
				-H 'x-requested-with: XMLHttpRequest' \
				-H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36' \
				-H "x-csrftoken: $csrf" \
				-H "x-ig-app-id: ${APP_ID}" \
				-H 'origin: https://www.instagram.com' \
				-H 'referer: https://www.instagram.com/' \
				-H "accept-language: ${INDONESIA}" \
				-H "cookie: mid=$mid; ig_did=$did; csrftoken=$csrf;" \
			        --data-urlencode "username=${1}" --data-urlencode "enc_password=#PWD_INSTAGRAM_BROWSER:0:${WAKTU}:${2}" --data-urlencode "optIntoOneTap=false" --compressed -sL -D -)
		# login=$(curl -D - 'https://www.instagram.com/accounts/login/ajax/' \
			#        -H 'origin: https://www.instagram.com' \
			#        -H 'x-requested-with: XMLHttpRequest' \
			#        -H "user-agent: $useragent" \
			#        -H "x-csrftoken: $csrf" \
			#        -H 'content-type: application/x-www-form-urlencoded' \
			#        -H 'accept: */*' \
			#        -H 'referer: https://www.instagram.com/accounts/login/' --data-urlencode "username=${1}" --data-urlencode "enc_password=#PWD_INSTAGRAM_BROWSER:0:${time}:${2}" --data-urlencode "optIntoOneTap=false" --compressed -sL)
		local check=$(echo -e "$login" | grep -Po '(?<=checkpoint_url":")[^"]*')
		local usid=$(echo -e "$login" | grep -Po '(?<=userId":")[^"]*'|sort -u)
		local isauth=$(echo -e "$login" | grep -Po '(?<="authenticated":)[^,]*')
		# perbedaan .
		local session=$(echo -e "$login" | grep -Po '(?<=sessionid=)[^;]*')
		echo "${login}" >> $randomNumber.cookies
	else
		for i in "${files[@]}";
		do
			echo "Found -${SCRIPT_DIR}-";
		done
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
function gaskan(){
	Fruits=('csrftoken' 'ig_did' 'sessionid')
	Fruits[0]="csrftoken"
	Fruits[1]="ig_did"
	Fruits[2]="sessionid"
	#find=$(find *.cookies -type f)
	mapfile -t oke < <(cat *.cookies)
	x=$(/bin/true|echo "${Fruits[0]}")
	b=$(/bin/true|echo "${Fruits[1]}")
	p=$(/bin/true|echo "${Fruits[2]}")
	#;echo $? false or true?..
}
function open(){
	for URL in $(cat fot.txt); do
		idd
	done
}
function gete(){
	echo ${oke[31]}|grep -Po "(?<=$b=)[^;]*"
	gaskan
	### MANUAL
	csrf=$(cat 6071.cookies| grep -Po '(?<=csrftoken=)[^;]*')
	did=$(cat 6071.cookies|grep -Po '(?<=ig_did=)[^;]*')
	ses=$(cat 6071.cookies|grep -Po '(?<=sessionid=)[^;]*')
	v=$(open)
	echo -e "$v" >> NAH.txt
	IFS=$'\n'
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
jumlahlines=$(cat $USERmailist | wc -l <(cut -f1 -d' '))
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
# Copyright © 2021
# All rights reserved.

