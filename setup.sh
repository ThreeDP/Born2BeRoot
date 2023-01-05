#!/bin/sh

# Installing tools
sudo apt-get update -y && apt-get upgrade -y 
sudo apt-get install -y vim openssh-server
sed -i 's/#Port 22/Port 4242/g' /etc/ssh/sshd_config
service ssh restart
sudo apt-get install ufw -y
ufw enable && ufw allow ssh && ufw allow 4242
