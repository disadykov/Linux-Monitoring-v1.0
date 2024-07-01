#!/bin/bash
#ram info

GB=1048576 #1024 * 1024

ram_total='RAM_TOTAL'
RAM_BYTE=`free | grep Mem | awk '{print $2}'`
RAM_TOTAL=$(bc<<<"scale=3;$RAM_BYTE/$GB")

tmp_total=`echo "$RAM_TOTAL" | awk -F '.' '{print $1}'`
if [ "$tmp_total" = "" ]
  then
    ./print.sh "$ram_total" "0$RAM_TOTAL GB"
  else
    ./print.sh "$ram_total" "$RAM_TOTAL GB"
fi


ram_used='RAM_USED'
RAM_USED_BYTE=`free | grep Mem | awk '{print $3}'`
RAM_USED=$(bc<<<"scale=3;$RAM_USED_BYTE/$GB")

tmp_used=`echo "$RAM_USED" | awk -F '.' '{print $1}'`
if [ "$tmp_used" = "" ]
  then
    ./print.sh "$ram_used" "0$RAM_USED GB"
  else
    ./print.sh "$ram_used" "$RAM_USED GB"
fi


ram_free='RAM_FREE'
RAM_FREE_BYTE=`free | grep Mem | awk '{print $4}'`
RAM_FREE=$(bc<<<"scale=3;$RAM_FREE_BYTE/$GB")

tmp_free=`echo "$RAM_FREE" | awk -F '.' '{print $1}'`
if [ "$tmp_free" = "" ]
  then
    ./print.sh "$ram_free" "0$RAM_FREE GB"
  else
    ./print.sh "$ram_free" "$RAM_FREE GB"
fi

#free -h