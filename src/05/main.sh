#!/bin/bash
#Part 5. File system research

start_sript=`date +%s.%N`
clear

if [ -n "$1" ]
  then
    count_param=$#
    if [ $count_param -eq 1 ]
      then 
        PATH_PARAM=$1
        LAST_CHARACTER=${PATH_PARAM:$((${#PATH_PARAM}-1)):1}
        
        if [ "$LAST_CHARACTER" = "/" ] 
          then
            if [ ! -d "$1" ] 
              then
	              echo "No such directory or path. Try again"
	              exit 1
              else
                ./folders.sh $PATH_PARAM
                check=$?
                if [ $check -eq 1 ]
                  then 
                    exit 1
                  else
                    ./files_count.sh $PATH_PARAM
                    ./top_files.sh $PATH_PARAM
                    ./time_script.sh $start_sript
                fi
            fi
          else
            echo "Missing character '/' at the end of the parameter. Try again"
        fi
      else
        echo "Too many parametrs. Try running the script again with one parameter"
    fi
  else
    echo "The script must be run with one parameter. Try again."
fi


