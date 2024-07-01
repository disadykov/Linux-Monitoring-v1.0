#!/bin/bash
#system info

host_name='HOSTNAME'
HOSTNAME=`hostname`

time_zone='TIMEZONE'
TIMEZONE=`timedatectl | grep  "Time zone" | awk '{$1=$2=""; $0=$0; $1=$1; print}'` #Вывожу со 3го столбца до последнего, чтобы убрать лишние записи

user='USER'
USER=`whoami` 

os='OS'
OS=`cat /etc/issue | awk '{print $1, $2, $3}'`

Date='DATE'
DATE=`date '+%d %b %Y %H:%M:%S'`

Uptime='UPTIME'
UPTIME=`uptime -p | awk '{$1=""; $0=$0; $1=$1; print}'` #Вывожу со 2го столбца до последнего, чтобы убрать "up" в начале

uptime_sec='UPTIME_SEC'
UPTIME_SEC=`cat /proc/uptime | awk '{print $1}'`


./print.sh "$host_name" "$HOSTNAME"
./print.sh "$time_zone" "$TIMEZONE" 
./print.sh "$user" "$USER"
./print.sh "$os" "$OS"
./print.sh "$Date" "$DATE"
./print.sh "$Uptime" "$UPTIME"
./print.sh "$uptime_sec" "$UPTIME_SEC"