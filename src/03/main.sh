#!/bin/bash
#Part 3. Part 3. Visual output design for the system research script

clear 

param_count=${#}

if [ $param_count -eq 4 ]
  then

    ./is_num.sh $1 $2 $3 $4
    is_num=$?
    if [ $is_num -eq 0 ]
      then
        column1_background=$1
        column1_font_color=$2
        column2_background=$3
        column2_font_color=$4

        if [ $column1_background -eq $column1_font_color ] || [ $column2_background -eq $column2_font_color ] 
          then
            echo "The font and background colors of the same column must not match. Try running the script again."
          else
            #system info
            ./system.sh $1 $2 $3 $4
            #network info
            ./network.sh $1 $2 $3 $4
            #ram info
            ./ram.sh $1 $2 $3 $4
            #space info
            ./space.sh $1 $2 $3 $4
        fi


      else
        echo "One or more parameters are invalid. Try again with the correct set of parameters." 
    fi

  else
    if [ $param_count -gt 4 ]
      then 
        msg="many"
      else
        msg="few"
    fi
    echo "Too $msg parameters. Try again with four(4) parameters."
fi

