#!/bin/bash
#Script auto create user SSH

read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (day): " Activetime

IP=`dig +short myip.opendns.com @resolver1.opendns.com`
useradd -e `date -d "$Activetime days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e "--------------------------------------"
echo -e "           Account Details"
echo -e "--------------------------------------"
echo -e "     Host: $IP"
echo -e "     Username: $Login "
echo -e "     Password: $Pass"
echo -e "     Expiration: $exp"
echo -e "     Download -             TCP Main:  http://$IP:81/client.ovpn"
echo -e "              OpenVPN (Dropbear 443):  http://$IP:81/umo-db.ovpn"
echo -e "              OpenVPN (Dropbear 443):  http://$IP:81/maxis-db.ovpn"
echo -e "              OpenVPN (Dropbear 443):  http://$IP:81/digi-db.ovpn"
echo -e "                   OpenVPN (SSH 143):  http://$IP:81/umo-ssh.ovpn"
echo -e "                   OpenVPN (SSH 143):  http://$IP:81/maxis-ssh.ovpn"
echo -e "                   OpenVPN (SSH 143):  http://$IP:81/digi-ssh.ovpn"
echo -e "     Protocol: TCP"
echo -e "Port OpenSSH: 22,444"
echo -e "Port Dropbear: 143,3128"
echo -e "Port SSL: 443"
echo -e "Port Squid: 8000,8080"
echo -e "+- -- --=[ THANK YOU ]=-- -- -+" | lolcat
