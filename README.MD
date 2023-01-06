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