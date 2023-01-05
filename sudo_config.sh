#!/bin/bash
# necessário está no modo root.
echo -e '#My setup\ndapaulin  ALL=(ALL:ALL) ALL ' | sudo EDITOR='tee -a' visudo &&
echo -e '\nDefaults passwd_tries=3' | sudo EDITOR='tee -a' visudo &&
echo -e 'Defaults badpass_message="Wrong password. Try again!"' | sudo EDITOR='tee -a' visudo
if [ ! -d/var/log/sudo ]; then
    echo "create dir"
    mkdir /var/log/sudo
fi
echo -e 'Defaults logfile="/var/log/sudo/sudo.log"' | sudo EDITOR='tee -a' visudo &&
echo -e 'Defaults log_input' | sudo EDITOR='tee -a' visudo &&
echo -e 'Defaults log_output' | sudo EDITOR='tee -a' visudo &&
echo -e 'Defaults requiretty' | sudo EDITOR='tee -a' visudo