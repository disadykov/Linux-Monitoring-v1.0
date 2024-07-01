#!/bin/bash
#network info

ip='IP'
IP=`hostname -I`

if [ -n "$IP" ]
  then 
    IP=`hostname -I | awk '{print $1}'`
  else 
    IP=`ip address | grep inet | grep "host lo" | awk '{print $2}' | awk -F '/' '{print $1}'`
fi
./print.sh "$ip" "$IP" $1 $2 $3 $4
#echo ${#IP} - длинна строки

mask='MASK'
MASK=`ip a | grep "$IP" | awk '{print $2}' | awk -F '/' '{print $2}'`

#запись маски в бинарное представление
count=32
vmask=$MASK
str=''
oct=0
while [ $count -gt 0 ]
  do
    count=$(( $count - 1 ))
    if [ $vmask -gt 0 ]
      then 
        str+="1"
      else
        str+="0"
    fi
    vmask=$(( $vmask - 1 ))
    oct=$(( $oct + 1))
    if [[ $oct -eq 8 && $count -gt 0 ]]
      then 
        str+="."
        if [ $oct -eq 8 ]
          then
            oct=0
        fi
    fi
done

#перевод маски в привычный формат из двоичного
oct1=`echo $str | awk -F '.' '{print $1}'`
oct2=`echo $str | awk -F '.' '{print $2}'`
oct3=`echo $str | awk -F '.' '{print $3}'`
oct4=`echo $str | awk -F '.' '{print $4}'`

A=$((2#$oct1))
B=$((2#$oct2))
C=$((2#$oct3))
D=$((2#$oct4))

MASK=`echo "$A.$B.$C.$D"`
./print.sh "$mask" "$MASK" $1 $2 $3 $4


gateway='GATEWAY'
GATEWAY=`ip route | grep default | awk '{print $3}'`
./print.sh "$gateway" "$GATEWAY" $1 $2 $3 $4