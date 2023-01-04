

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