#!/bin/bash
sed -i 's/#Port 22/Port 4242/g' /etc/ssh/sshd_config &&
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/g' /etc/ssh/sshd_config &&
sudo systemctl restart ssh
sudo rm ssh_config.sh
sudo apt-get install net-tools -y
