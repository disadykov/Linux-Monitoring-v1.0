#!/bin/bash
# Part 1. First effort

clear
if [ -n "$1" ]
  then
    ./is_num.sh $1
  else
    echo "Parameters is not found!"
fi

