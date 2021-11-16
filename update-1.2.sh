#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
versi=$(cat /home/ver)
if [[ $versi == 1.3 ]]; then
echo "You Have The Latest Version"
exit 0
fi
echo "Start Update"
cd /usr/bin
wget -O menu "https://raw.githubusercontent.com/dwiandhik/autoscriptsshh/main/menu.sh"
wget -O usernew "https://raw.githubusercontent.com/dwiandhik/autoscriptsshh/main/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/dwiandhik/autoscriptsshh/main/trial.sh"
wget -O change-port "https://raw.githubusercontent.com/dwiandhik/autoscriptsshh/main/change.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/dwiandhik/autoscriptsshh/main/port-ovpn.sh"
wget -O port-ssl "https://raw.githubusercontent.com/dwiandhik/autoscriptsshh/main/port-ssl.sh"
wget -O port-wg "https://raw.githubusercontent.com/dwiandhik/autoscriptsshh/main/port-wg.sh"
wget -O port-tr "https://raw.githubusercontent.com/dwiandhik/autoscriptsshh/main/port-tr.sh"
wget -O port-sstp "https://raw.githubusercontent.com/dwiandhik/autoscriptsshh/main/port-sstp.sh"
wget -O port-squid "https://raw.githubusercontent.com/dwiandhik/autoscriptsshh/main/port-squid.sh"
wget -O port-ws "https://raw.githubusercontent.com/dwiandhik/autoscriptsshh/main/port-ws.sh"
wget -O port-vless "https://raw.githubusercontent.com/dwiandhik/autoscriptsshh/main/port-vless.sh"
wget -O wbmn "https://raw.githubusercontent.com/dwiandhik/autoscriptsshh/main/webmin.sh"
wget -O xp "https://raw.githubusercontent.com/dwiandhik/autoscriptsshh/main/xp.sh"
wget -O limit-speed "https://raw.githubusercontent.com/dwiandhik/autoscriptsshh/main/limit-speed.sh"
wget -O add-sstp "https://raw.githubusercontent.com/dwiandhik/autoscriptsshh/main/add-sstp.sh"
wget -O add-ws "https://raw.githubusercontent.com/dwiandhik/autoscriptsshh/main/add-ws.sh"
wget -O add-vless "https://raw.githubusercontent.com/dwiandhik/autoscriptsshh/main/add-vless.sh"
wget -O add-tr "https://raw.githubusercontent.com/dwiandhik/autoscriptsshh/main/add-tr.sh"
chmod +x change-port
chmod +x port-ovpn
chmod +x port-ssl
chmod +x port-wg
chmod +x port-sstp
chmod +x port-tr
chmod +x port-squid
chmod +x port-ws
chmod +x port-vless
chmod +x wbmn
chmod +x xp
chmod +x limit-speed
echo "0 6 * * * root clear-log && reboot" > /etc/crontab
echo "0 0 * * * root xp" > /etc/crontab
0 1 * * * root delete
cd
echo "1.3" > /home/ver
clear
echo " Fix minor Bugs"
echo " Now You Can Change Port Of Some Services"
echo " Reboot 5 Sec"
sleep 5
rm -f update.sh
reboot
