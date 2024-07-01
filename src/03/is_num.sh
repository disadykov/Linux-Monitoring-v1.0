#!/bin/bash

function check_num {
if ! [[ $1 =~ ^[-]?[0-9]+$ ]] 
    then
      flag=0
    else 
      if [[ $1 -ge 1 && $1 -le 6 ]]
        then
          flag=1
        else 
          flag=0
      fi
  fi
return $(($flag))
}

#Проверка, что все параметры коректны
check=0
for (( i=1; i <= 4; i++ ))
do
  check_num $1
  value=$?
  if [ $value -eq 1 ]
    then
      check=$[ $check + $value ]
  fi
  shift
done

if [ $check -eq 4 ]
  then 
    exit 0
  else 
    exit 1
fi