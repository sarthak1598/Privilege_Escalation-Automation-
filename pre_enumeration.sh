#Shell Script to gathering information before perfora privilege escalation in UNIX/linux bases operating systems 
# to pick up the shell 

#!/bin/sh

echo Linux kernel version
uname -a

echo current_userinformation 
whoami 

echo Mounted-filesystems 
mount -l

echo System Password file (hashed)
# cotainig the system user's passwords hashed form 
cat /etc/passwd  


echo ip routes 
ip link show 

echo Network configuration
ifconfig -a
 
 st file inside the /etc/hosts 
cat /etc/hosts
# showing the maintained arp tale 
arp

echo  checking the compiler based tools available in the operating system 
# using the which command with the respective compiler 

which gcc
which g++

which python

echo Installed packages in operating system 
dpkg -l

echo Services/Network statistics or initialised sockets 
netstat -tulnpe

echo Processes runnnig in the background of the operating system 
ps -aux

echo processes top command 
top 

echo Scheduled jobs queue 
find /etc/cron* -ls 2>/dev/null
find /var/spool/cron* -ls 2>/dev/null

echo Readable files in  root of /etc directory 
find /etc -user `id -u` -perm -u=r \
 -o -group `id -g` -perm -g=r \
 -o -perm -o=r \
 -ls 2>/dev/null 
echo SUID and GUID files
find / -type f -perm -u=s -o -type f -perm -g=s \
 -ls 2>/dev/null

echo Writable files outside HOME 
mount -l find / -path “$HOME” -prune -o -path “/proc” -prune -o \( ! -type l \) \( -user `id -u` -perm -u=w  -o -group `id -g` -perm -g=w  -o -perm -o=w \) -ls 2>/dev/null
