#!/bin/bash

#Checking the System Information
echo " "
echo "-----------------------------------------------------"
echo "--------------|    Script Started     |--------------"
echo "-----------------------------------------------------"
echo " "
echo " "
echo -e "\e[31mStatus: \e[0m"
echo " "
uptime
echo " "
echo -e "\e[31mOS Version: \e[0m"
echo " "
sudo cat /etc/os-release|grep -i pretty
echo " "
echo -e "\e[31mKernel Version: \e[0m"
echo " "
uname -r
echo " "
echo -e "\e[31mMemory: \e[0m"
free -h
echo " "
echo -e "\e[31mDisk Usage: \e[0m"
echo " "
df -h
echo  " "
echo -e "\e[31mCPU Info: \e[0m"
echo " "
cat /proc/cpuinfo  |grep -i "model name"
cat /proc/cpuinfo  |grep -i "cpu core"
echo "-----------------------------------------------------"
echo "--------------|    Script Completed   |--------------"
echo "-----------------------------------------------------"
echo " "
