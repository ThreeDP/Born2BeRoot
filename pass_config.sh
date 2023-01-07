#!/bin/bash
sudo sed -i 's/PASS_MAX_DAYS\t\([0-9]\{1,\}\)/PASS_MAX_DAYS\t30/g' /etc/login.defs &&
sudo sed -i 's/PASS_MIN_DAYS\t\([0-9]\{1,\}\)/PASS_MIN_DAYS\t2/g' /etc/login.defs &&
sudo sed -i 's/PASS_WARN_AGE\t\([0-9]\{1,\}\)/PASS_WARN_AGE\t7/g' /etc/login.defs 
sudo chage -M 30 dapaulin && sudo chage -M 30 root
sudo chage -m 2 dapaulin && sudo chage -m 2 root
sudo chage -W 7 dapaulin && sudo chage -W 7 root
sudo sed -i 's/# difok = \([0-9]\{1,\}\)/difok = 7/g' /etc/security/pwquality.conf &&
sudo sed -i 's/# minlen = \([0-9]\{1,\}\)/minlen = 10/g' /etc/security/pwquality.conf &&
sudo sed -i 's/# dcredit = \([0-9]\{1,\}\)/dcredit = -1/g' /etc/security/pwquality.conf &&
sudo sed -i 's/# ucredit = \([0-9]\{1,\}\)/ucredit = -1/g' /etc/security/pwquality.conf &&
sudo sed -i 's/# lcredit = \([0-9]\{1,\}\)/lcredit = -1/g' /etc/security/pwquality.conf &&
sudo sed -i 's/# maxrepeat = \([0-9]\{1,\}\)/maxrepeat = 3/g' /etc/security/pwquality.conf &&
sudo sed -i 's/# usercheck = \([0-9]\{1,\}\)/usercheck = 1/g' /etc/security/pwquality.conf &&
sudo sed -i 's/# retry = \([0-9]\{1,\}\)/retry = 3/g' /etc/security/pwquality.conf &&
sudo sed -i 's/# enforce_for_root/enforce_for_root/g' /etc/security/pwquality.conf
sudo rm pass_config.sh