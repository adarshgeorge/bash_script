#!/bin/bash

echo "----------------------------------------------------------------------"
echo "---------------------|    Script Started     |------------------------"
echo "----------------------------------------------------------------------"
echo " "
echo -e "\e[31mOS Version: \e[0m"`cat /etc/os-release|grep -i pretty | tr "=" "\n"| grep '"'`
echo -e "\e[31mKernel Version: \e[0m"`uname -r`
echo -e "\e[31mHostname: \e[0m"`hostname`
echo -e "\e[31mInternel IP: \e[0m"`hostname -i`
echo -e "\e[31mPublic IP: \e[0m"`curl -s ipecho.net/plain;echo`
echo -e "\e[31mCPU: \e[0m"`awk -F':' '/^model name/ {print $2}' /proc/cpuinfo | uniq | sed -e 's/^[ \t]*//'`
echo -e "\e[31mCPU Usage: \e[0m"`cat /proc/stat | awk '/cpu/{printf("%.2f%\n"), ($2+$4)*100/($2+$4+$5)}' |  awk '{print $0}' | head -1`
echo -e "\e[31mDisk Usage: \e[0m"
echo " "
df -h
echo  " "
echo -e "\e[31mNetwork Usage: \e[0m"

echo -e "\e[31mNumber of connections the IPs are connected to the server using TCP or UDP protocol.: \e[0m"

sudo netstat -ntu | grep ESTAB | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr

echo -e "\e[31mActive listening ports and applications on the server\e[0m"

sudo netstat -tulpn | grep LISTEN

echo "----------------------------------------------------------------------"
echo "------------------|       Script Completed        |-------------------"
echo "----------------------------------------------------------------------"
