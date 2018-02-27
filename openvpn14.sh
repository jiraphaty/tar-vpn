﻿#!/bin/bash
#script by jiraphat yuenying
#install openvpn
apt-get update
MYIP=$(wget -qO- ipv4.icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";

apt-get update
apt-get -y install openvpn easy-rsa;

wget -O /etc/openvpn/openvpn.tar "https://raw.githubusercontent.com/jiraphaty/tar-vpn/master/openvpn.tar"
wget -O /etc/openvpn/default.tar "https://raw.githubusercontent.com/jiraphaty/tar-vpn/master/default.tar"
cd /etc/openvpn/
tar xf openvpn.tar
tar xf default.tar
cp sysctl.conf /etc/
cp before.rules /etc/ufw/
cp ufw /etc/default/
rm sysctl.conf
rm before.rules
rm ufw
service openvpn restart

#install squid3

apt-get -y install squid3;
wget -O /etc/squid3/squid.conf "https://raw.githubusercontent.com/jiraphaty/tar-vpn/master/squid.conf"
sed -i $MYIP2 /etc/squid3/squid.conf;
service squid3 restart

#install nginx
#apt-get -y install nginx;
#cd
#rm /etc/nginx/sites-enabled/default
#rm /etc/nginx/sites-available/default
#wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/jiraphaty/tar-vpn/master/nginx.conf"
#mkdir -p /home/vps/public_html
#echo "<pre>Setup by Jiraphat Yuenying</pre>" > /home/vps/public_html/index.html
#wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/jiraphaty/tar-vpn/master/vps.conf"
#service nginx restart

#config client
#cd /etc/openvpn/
#wget -O /etc/openvpn/client.ovpn "https://raw.githubusercontent.com/jiraphaty/tar-vpn/master/client.ovpn"
#wget -O /etc/openvpn/netfree.ovpn "https://raw.githubusercontent.com/jiraphaty/tar-vpn/master/netfree.ovpn"
#sed -i $MYIP2 /etc/openvpn/client.ovpn;
#sed -i $MYIP2 /etc/openvpn/netfree.ovpn;
#cp client.ovpn /home/vps/public_html/
#cp netfree.ovpn /home/vps/public_html/

ufw allow ssh
ufw allow 1194/tcp
ufw allow 8080/tcp
ufw allow 3128/tcp
ufw allow 80/tcp
yes | sudo ufw enable
# download script
cd /usr/bin
wget -O menu "https://raw.github.com/blazevpn/autoscript/master/menu.sh"
wget -O usernew "https://raw.github.com/blazevpn/autoscript/master/usernew.sh"
wget -O trial "https://raw.github.com/blazevpn/autoscript/master/trial.sh"
wget -O hapus "https://raw.github.com/blazevpn/autoscript/master/hapus.sh"
wget -O login "https://raw.github.com/blazevpn/autoscript/master/user-login.sh"
wget -O member "https://raw.github.com/blazevpn/autoscript/master/user-list.sh"
wget -O resvis "https://raw.github.com/blazevpn/autoscript/master/resvis.sh"
wget -O speedtest "https://raw.github.com/blazevpn/autoscript/master/speedtest_cli.py"
wget -O about "https://raw.github.com/blazevpn/autoscript/master/about.sh"
echo "0 0 * * * root /usr/bin/reboot" > /etc/cron.d/reboot
echo "* * * * * service dropbear restart" > /etc/cron.d/dropbear
chmod +x menu
chmod +x usernew
chmod +x trial
chmod +x hapus
chmod +x login
chmod +x member
chmod +x resvis
chmod +x speedtest
chmod +x about
clear
printf '###############################\n'
printf '# Script by Jiraphat Yuenting #\n'
printf '#                              #\n'

printf '#                             #\n'
printf '#    พิมพ์ menu เพื่อใช้คำสั่งต่างๆ   #\n'
printf '###############################\n'

printf '\n\nเพิ่ม user โดยใช้คำสั่ง useradd'
printf '\n\nตั้งรหัสโดย ใช้คำสั่ง passwd'
printf '\n\nคุณจำเป็นต้องรีสตาร์ทระบบหนึ่งรอบ (y/n):'
read a
if [ $a == 'y' ]
then
reboot
else
exit
fi
#MYIP=$(wget -qO- ipv4.icanhazip.com);
#MYIP2="s/xxxxxxxxx/$MYIP/g";
#echo -e "\n\n\t\t\tพิมพ์คำสั่ง         ufw enable\n\n"
#echo -e "\t\t\tกด    y  เพื่อตกลง\n\n"
#echo -e "\t\t\tรีเครื่องหนึ่งรอบ โดยใช้คำสั่ง reboot\n\n"
#echo -e "ดาวน์โหลดไฟล์แบบไม่มีโฮส  : http://$MYIP/client.ovpn\n\n"
#echo -e "ดาวน์โหลดไฟล์แบบมีโฮส  : http://$MYIP/netfree.ovpn\n\n"
#echo -e "หรือเข้าไปโหลดในเว็บ  : http://$MYIP/\n\n"



