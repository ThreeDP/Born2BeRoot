# Config a Debian virtual machine

### machine scheme 

    boot        500mb   ext4
    root        1.9gb   ext4
    swap        448mb   swap area
    home        973mb   ext4
    var         584mb   ext4
    srv         584mb   ext4
    tmp         584mb   ext4
    var-log     779mb   ext4

# Config sudo
> You must be logged in as root to run this configuration.

    su -
    apt-get update -y
    apt-get upgrade -y
    apt-get install sudo -y

### Add user into sudo group

    usermod -aG sudo dapaulin
    getent group sudo

### Config rules to sudo

    apt-get install git wget -y
    wget https://raw.githubusercontent.com/ThreeDP/Born2BeRoot/main/sudo_config.sh
    chmod 744 sudo_config.sh
    ./sudo_config.sh

# AppArmor
>

    sudo aa-status  //apparmor status

# UFW
>

### Install and enable ufw

    sudo apt-get update -y 
    sudo apt-get upgrade -y
    sudo apt-get install ufw -y
    sudo ufw enable
    sudo ufw status verbose

### allow traffic on port 4242

    sudo ufw allow 4242 // alow port
    sudo ufw delete <action> <port> // delete port
    sudo ufw delete <number> // delete port position

# Config SSH

### Install openssh-server

    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install openssh-server -y
    sudo systemctl status ssh

### Alter port for 4242

    sudo wget https://raw.githubusercontent.com/ThreeDP/Born2BeRoot/main/ssh_config.sh
    sudo chmod 744 ssh_config.sh
    sudo ./ssh_config.sh
    

### Removig internet socket

    sudo apt-get install net-tools -y
    ifconfig -a

> use to get infos of network interface, IP address and netmask

    route -n

> use to get info of gateway

### alter network interface auto for static

    sudo vim /etc/network/interfaces
    // alter in the file
    # The primary network interface IPv
    allow-hotplug <network interface>
    iface <network interface> inet static
        address <IP address>
        netmask <netmask>
        gateway <gateway>
    # the primary network interface IPv6
    iface <network interface> inet6 auto

    sudo systemctl reboot

**example:**
 
    # The primary network interface IPv
    allow-hotplug enp0s3
    iface enp0s3 inet static
        address 10.11.200.247
        netmask 255.255.0.0
        gateway 10.11.254.254
    # the primary network interface IPv6
    iface enp0s3 inet6 auto

### ssh connection
    ssh <server-user>@<server IP address> -p <ssh-port>
    exit

# Password config

    sudo apt-get install libpam-pwquality - y
    sudo wget https://raw.githubusercontent.com/ThreeDP/Born2BeRoot/main/pass_config.sh
    sudo chmod 744 pass_config.sh
    sudo ./pass_config.sh
    sudo passwd dapaulin
    sudo passwd root

### pass testings

    1234
    U1234
    G0123456789
    G01TY0967WR
    Goooogle1997
    dapaulin1997D
    42Davy42$1997   // root

    Born2BeRoot97   // dapaulin

# Hostname and New User and Groups

    // Change hostname and view new hostname
    sudo hostnamectl set-hostname <new_hostname>
    hostnamectl status

    // User admin
    useradd : create new user
    usermod : change user params
        -l for username,
        -c for full name,
        -g for groups
    userdel -r : deletes a user and all associated files.
    id -u : display user ID
    users : shows users list

    // groups admin
    groupadd : creates a new group.
    gpasswd -a : adds a user to a group.
    gpasswd -d : removes a user from a group.
    groupdel : deletes a group.
    groups : displays the groups of a user.
    id -g : shows a user’s main group ID.
    getent group : displays a list of all users in a group.

# Monitoring config

    su -
    cd /root/
    wget https://raw.githubusercontent.com/ThreeDP/Born2BeRoot/main/monitoring.sh
    chmod 777 monitoring.sh

# Config Cron

    su -
    systemctl enable cron
    apt-get install bc -y
    echo -e '\n*/10 * * * * bash /root/monitoring.sh | wall' >> /var/spool/cron/crontabs/root
    sed -i 's/\*\/10 \* \* \* \*/\*\/10 \* \* \*/g' /var/spool/cron/crontabs/root


and activate TTY to stop malicious software from giving itself root privileges
via sudo.

What is AppArmor or SELinux?

Diferences beteween aptitude and apt?

Configurar ssh para não permitir entrar com root.

Configure UFW. thus leave only port 4242.

hostname: dapaulin42

Password policy
- expire in 30 days;
- minimum number of days to change the password again will be 2;
- The user has to receive a warning message 7 days before their password expires.
- Password pattern: min 10 chars, 1 uppercase, 1 lowercase, 1 number, not more than 3 consecutives identical chars;
- don't contain the name of user.;


Sudo install

 cat /etc/os-release
> to check the OS information,

- lsblk
> to check our partitions,

- apt --version
> to check if the packet manager is installed by default,

- date
> to check the time zone. If the time zone is incorrect, it’s not very important for Born2beroot

- exit or logout
> quits the current session and returns us to the connection prompt.

- su name_usr
> connect as a different user. We will be asked for the other user’s password. Running the su (switch user) command without specifying a username, will let us log in as the default user, root. We can exit at any time to return to the previous user session.
- systemctl reboot
> restarts the system (requires root permissions)
- systemctl poweroff
> turns off the system (requires root permissions)