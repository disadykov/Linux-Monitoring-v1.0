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


./print.sh "$host_name" "$HOSTNAME" $1 $2 $3 $4
./print.sh "$time_zone" "$TIMEZONE" $1 $2 $3 $4
./print.sh "$user" "$USER" $1 $2 $3 $4
./print.sh "$os" "$OS" $1 $2 $3 $4
./print.sh "$Date" "$DATE" $1 $2 $3 $4
./print.sh "$Uptime" "$UPTIME" $1 $2 $3 $4
./print.sh "$uptime_sec" "$UPTIME_SEC" $1 $2 $3 $4