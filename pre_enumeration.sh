#Shell Script to gathering information before perfora privilege escalation in UNIX/linux bases operating systems 
# to pick up the shell 

#!/bin/sh

echo Linux kernel version
uname -a ; uname -r 

echo current_userinformation 
whoami ; id 

echo file system information 
df -a

echo cpu-information 
cat /proc/cpuinfo 

echo show user hashes 
cat /etc/shadow # but the privileged executable command 

echo currently logged in users 
finger 

echo list all groups on the system 
cat /etc/groups 

echo who can do same as root 
cat /etc/sudoers 

echo list of last loggedin users
last ; pwd # present working directory also 

echo display the environmental variables 
env

echo display default system variables 
cat /etc/profiles 

echo display the available shells of os 
cat /etc/shells 

echo display all the path information 
echo $PATH

echo checking the running permission levels for some specific binaries

sudo -l 2>/dev/null | grep -w 'nmap|perl|'awk'|'find'|'bash'|'sh'|'man'

echo display command history 
history 

echo Mounted-filesystems 
mount -l

echo System Password file (hashed)
# cotainig the system user's passwords hashed form 
cat /etc/passwd  

echo all the informationb of Netoworking , Routing and communication 

echo list of all network interfaces
/sbin/ifconfig -a && cat /etc/network/interfaces 

echo Network configuration
ifconfig -a
 
echo diplay route information 
route && ip link show

echo display arp information 
arp -a

echo show DNS server address information 
cat /etc/resolv.conf 

echo listing all UDP and TCP sockets and related PID's 
netstat -antp && netsta -anup 

echo list the linux firewalls rules configured 
iptables -L

echo showing the port numbers and services cross mappings
cat /etc/services 

 host file inside the /etc/hosts 
cat /etc/hosts
echo  checking the compiler based tools available in the operating system 
# using the which command with the respective compiler 

which gcc
which g++

which python

echo Installed packages in operating system 
dpkg -l

echo Services/Network statistics or initialised sockets 
netstat -tulnpe

echo Processes runnnig in the operating system and also those one running as the root 
ps -aux && ps aux | grep root 

echo show services managed by the inetd deomen 
cat /etc/inetd.conf 

echo processes running using  top command 
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
