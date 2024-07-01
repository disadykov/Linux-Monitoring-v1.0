#!/bin/bash
#Part 2. System research

clear 

if [ -n "$1" ]
  then
    echo "Please, try again without parameters"
    exit 1
  else
    #system info
    ./system.sh
    #network info
    ./network.sh
    #ram info
    ./ram.sh
    #space info
    ./space.sh
    echo
    read -p "Do you want to write data from screen to the file? (Y/N): " answer

    if [ "$answer" = "Y" ] || [ "$answer" = "y" ] 
      then
        DATE=`date '+%d_%m_%y_%H_%M_%S'`
        FILENAME=`echo "$DATE.status"`
        ./system.sh >> $FILENAME
        ./network.sh >> $FILENAME
        ./ram.sh >> $FILENAME
        ./space.sh >> $FILENAME
    fi
fi