
#!/bin/bash

iptables-save > ~/firewall.rules
systemctl stop firewalld.service
systemctl disable firewalld.service

systemctl NetworkManager stop
systemctl disable NetworkManager 
yum install curl -y
yum install perl -y
curl -o latest -L https://securedownloads.cpanel.net/latest
sh latest

