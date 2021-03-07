#!/bin/bash
#Script auto create trial user SSH
#will expired after 1 day


IP=`dig +short myip.opendns.com @resolver1.opendns.com`

Login=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=`</dev/urandom tr -dc a-f0-9 | head -c9`

useradd -e `date -d "$hari days" +"%Y-%m-%d"` -s /bin/false -M $Login
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "====Trial SSH Account====" | lolcat
echo -e "Host: $IP"
#echo -e "Port OpenSSH: 22,143"
#echo -e "Port Dropbear: 80,443"
#echo -e "Port Squid: 8080,3128"
echo -e "Config OpenVPN (TCP 1194): http://$IP:81/client.ovpn"
echo -e "Config OpenVPN (Dropbear 443): http://$IP:81/umo-db.ovpn"
echo -e "Config OpenVPN (Dropbear 443): http://$IP:81/maxis-db.ovpn"
echo -e "Config OpenVPN (Dropbear 443): http://$IP:81/digi-db.ovpn"
echo -e "Config OpenVPN (SSH 143): http://$IP:81/umo-ssh.ovpn"
echo -e "Config OpenVPN (SSH 143): http://$IP:81/maxis-ssh.ovpn"
echo -e "Config OpenVPN (SSH 143): http://$IP:81/digi-ssh.ovpn"
echo -e "Username: $Login"
echo -e "Password: $Pass\n"
echo -e "=========================" | lolcat
echo -e ""
