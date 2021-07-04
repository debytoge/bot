#!/bin/bash
blue='\e[0;34'
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'

clear
echo "Mass Grabber" | figlet | lolcat
echo "Powered By: Arya-Kun7 X Dhen Bhocil" | lolcat
echo "        Priv8 Mass Grabber Ip" | lolcat
echo "          t.me//dhenbhocil" | lolcat
read -p "Page: " hal0
read -p "Sampai Page: " hal
for((i=1;$hal0<=$hal;i++))
do
ip=$(curl -s "http://bitverzo.com/recent_ip?p=$i" | grep -oP '<a href="http://bitverzo.com/ip/(.*?)">(.*?)</a>' | cut -d "<" -f2 | cut -d ">" -f2)
total2=$(cat grabip.txt | wc -l)
if [[ $ip =~ '.' ]]; then
echo "$ip" >> grabip.txt
ips=$(echo "$ip" | wc -l)
echo -e "${okegreen} Grabbing --> IP : $ips <=> Total: $total2 Ip"
else
echo -e "${red} Grabbing --> IP : Error ~ <=> Total: $total2 Ip"
fi
done
