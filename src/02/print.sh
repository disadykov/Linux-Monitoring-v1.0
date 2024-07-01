#!/bin/bash

BOLD_START='\033[1m'
BOLD_END='\033[0m'

param1=$1
param2=$2

echo -e $BOLD_START$param1' = '$BOLD_END$param2
#printf "%-8s %-15s %s\n" "$param1" " = " "$param2"
