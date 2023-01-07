#!/bin/bash

### COLORS
CGR="\033[1;32m"
CRD="\033[1;31m"
CWH="\033[0;37m"
CYL="\033[1;33m"

### VARS
ARC=`uname -srvmo`
CPU=`grep "physical id" /proc/cpuinfo | uniq | wc -l`
VCPU=`grep  processor /proc/cpuinfo | uniq | wc -l`
MU=`free -m | grep Mem | awk '{print $3}'`
MT=`free -m | grep Mem | awk '{print $2}'`
MP=`free -m | grep Mem | awk '{printf("%.2f"), $3 / $2 * 100}'`
DU=`df -h --total | grep total | awk '{print $3}' | tr -d [:alpha:]`
DT=`df -h --total | grep total | awk '{print $2}'`
DP=`df -k --total | grep total | awk '{print $5}'`
CPUL=`top -bn1 | grep '^%Cpu' | cut -c 9- | xargs | awk '{printf("%.1f%%"), $1 + $3}'`
LB=`who -b | awk '{print($3 " " $4)}'`
LVM=`if [ $(lsblk | grep lvm | wc -l) -eq 0 ]; then echo no; else echo yes; fi`
TCP=`grep TCP /proc/net/sockstat | awk '{print $3}'`
UL=`who | wc -l`
IP=`hostname -I | awk '{print $1}'`
MAC=`ip link show | grep link/ether | awk '{print $2}'`
SU=`grep COMMAND /var/log/sudo/sudo.log | wc -l`

echo -e "#Architecture: "$ARC
echo -e "#CPU physical: "$CPU
echo -e "#vCPU: "$VCPU
echo -e "#Memory Usage: "$MU"/"$MT"MB ("$MP"%)"
echo -e "#Disk Usage: "$DU"/"$DT"b ("$DP")"
echo -e "#CPU load: "$CPUL
echo -e "#Last boot: "$LB
echo -e "#LVM use: "$LVM
echo -e "#Connections TCP: "$CGR$TCP" ESTABLISHED "$CWH
echo -e "#User log: "$UL
echo -e "#Network: IP"$IP" ("$MAC")"
echo -e "#Sudo: "$SU" cmd"