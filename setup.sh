#!/bin/sh

# install root
su -
apt-get update -y
apt-get upgrade -y
apt install sudo
# add to sudo group my user
usermod -aG sudo dapaulin
# check if the user is in sudo group
getent group sudo
# privilege for a sudo user
sudo apt-get install -y git wget
sh -c "$(wget https://raw.githubusercontent.com/ThreeDP/Born2BeRoot/main/sudo_config.sh -O -)"
./sudo_config.sh

# Installing tools
sudo apt-get update -y && apt-get upgrade -y 
sudo apt-get install -y vim openssh-server
sed -i 's/#Port 22/Port 4242/g' /etc/ssh/sshd_config
service ssh restart
sudo apt-get install ufw -y
ufw enable && ufw allow ssh && ufw allow 4242
