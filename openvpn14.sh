#!/bin/bash

#install openvpn

apt-get update
apt-get install openvpn easy-rsa -y

wget -O /etc/openvpn/openvpn.tar "https://raw.githubusercontent.com/jiraphaty/tar-vpn/master/openvpn.tar"
wget -O /etc/openvpn/default.tar "https://raw.githubusercontent.com/jiraphaty/tar-vpn/master/default.tar"
cd /etc/openvpn/
tar xf openvpn.tar
tar xf default.tar
cp sysctl.conf /etc/
cp before.rules /etc/ufw/
cp ufw /etc/default/
service openvpn start
service openvpn restart
