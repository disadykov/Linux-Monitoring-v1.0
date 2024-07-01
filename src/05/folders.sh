#!/bin/bash
#Total number of folders, including subfolders
#Top 5 folders with largest size in descending order (path and size)

PATH_PARAM=$1
BOLD_START='\033[1m'
BOLD_END_CLEAR='\033[0m'

ERROR=$( { `find $PATH_PARAM -type d | grep denied` | sed s/Output/Useless/; } 2>&1 )
if [ "$ERROR" = "" ]
  then 
    folders_count=`find $PATH_PARAM -type d | wc -l`
    folders_count=$(($folders_count - 1))
    echo -e $BOLD_START"Total number of folders (including all nested ones) = $BOLD_END_CLEAR$folders_count"
    echo -e $BOLD_START"TOP 5 folders of maximum size arranged in descending order (path and size): $BOLD_END_CLEAR"
    echo "$(du $PATH_PARAM -h | sort -hr | head -6 | awk '{print "-", $2"/,", $1}' | grep -v // | nl | awk '{print $1,$2,$3,$4}')"
  else
    echo "Permission denied to one or more directories. Run the script with the 'sudo' command or choose a different directory. Try again."
    exit 1
fi
