#!/bin/bash
#Part 4. Configuring visual output design for the system research script

clear 

function check_num {
  if ! [[ $1 =~ ^[-]?[0-9]+$ ]] 
    then
      flag=0
    else 
      flag=1
  fi
return $(($flag))
}

if [ -n "$1" ]
  then
    echo "Please, try again without parameters"
    exit 1
  else
    CONF_FILE='color.conf'
    column1_background_default=4
    column1_font_color_default=1
    column2_background_default=5
    column2_font_color_default=1

    if [ -e $CONF_FILE ]
      then
        column1_background=`cat $CONF_FILE | grep "column1_background" | awk -F '=' '{print $2}'`
        column1_background="$(tr -d ' ' <<< "$column1_background")"
        check_num $column1_background
        value=$?
        if [ $value -eq 0 ]
          then
            column1_background=0
        fi

        column1_font_color=`cat $CONF_FILE | grep "column1_font_color" | awk -F '=' '{print $2}'`
        column1_font_color="$(tr -d ' ' <<< "$column1_font_color")"
        check_num $column1_font_color
        value=$?
        if [ $value -eq 0 ]
          then
            column1_font_color=0
        fi

        column2_background=`cat $CONF_FILE | grep "column2_background" | awk -F '=' '{print $2}'`
        column2_background="$(tr -d ' ' <<< "$column2_background")"
        check_num $column2_background
        value=$?
        if [ $value -eq 0 ]
          then
            column2_background=0
        fi

        column2_font_color=`cat $CONF_FILE | grep "column2_font_color" | awk -F '=' '{print $2}'`
        column2_font_color="$(tr -d ' ' <<< "$column2_font_color")"
        check_num $column2_font_color
        value=$?
        if [ $value -eq 0 ]
          then
            column2_font_color=0
        fi

        flag_bg1=0
        flag_text1=0
        flag_bg2=0
        flag_text2=0
      else
        echo "column1_background=$column1_background_default" > $CONF_FILE
        echo "column1_font_color=$column1_font_color_default" >> $CONF_FILE
        echo "column2_background=$column2_background_default" >> $CONF_FILE
        echo "column2_font_color=$column2_font_color_default" >> $CONF_FILE
        column1_background=$column1_background_default
        column1_font_color=$column1_font_color_default
        column2_background=$column2_background_default
        column2_font_color=$column2_font_color_default
        
        flag_bg1=1
        flag_text1=1
        flag_bg2=1
        flag_text2=1
    fi

    if [[ $column1_background -ge 1 && $column1_background -le 6 ]]
      then
        BG1=$column1_background
      else
        flag_bg1=1
        BG1=$column1_background_default
    fi

    if [[ $column1_font_color -ge 1 && $column1_font_color -le 6 ]]
      then
        TEXT1=$column1_font_color
      else
        flag_text1=1
        TEXT1=$column1_font_color_default
    fi

    if [[ $column2_background -ge 1 && $column2_background -le 6 ]]
      then
        BG2=$column2_background
      else
        flag_bg2=1
        BG2=$column2_background_default
    fi
    
    if [[ $column2_font_color -ge 1 && $column2_font_color -le 6 ]]
      then
        TEXT2=$column2_font_color
      else
        flag_text2=1
        TEXT2=$column2_font_color_default
    fi

    if [ $BG1 = $flag_text1 ] 
      then
        flag_bg1=1
        BG1=$column1_background_default
        flag_text1=1
        TEXT1=$column1_font_color_default
    fi

    if [ $BG2 = $TEXT2 ] 
      then
        flag_bg2=1
        BG2=$column2_background_default
        flag_text2=1
        TEXT2=$column2_font_color_default
    fi

    #system info
    ./system.sh $BG1 $TEXT1 $BG2 $TEXT2
    #network info
    ./network.sh $BG1 $TEXT1 $BG2 $TEXT2
    #ram info
    ./ram.sh $BG1 $TEXT1 $BG2 $TEXT2
    #space info
    ./space.sh $BG1 $TEXT1 $BG2 $TEXT2
    #color scheme
    ./color_scheme.sh $BG1 $TEXT1 $BG2 $TEXT2 $flag_bg1 $flag_text1 $flag_bg2 $flag_text2
fi
