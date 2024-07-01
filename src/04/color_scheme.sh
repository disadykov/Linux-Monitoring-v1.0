#!/bin/bash
#color scheme

BG1=$1
TEXT1=$2
BG2=$3
TEXT2=$4
flag_bg1=$5
flag_text1=$6
flag_bg2=$7
flag_text2=$8

function color_name {
case $1 in
1) name='white' ;;
2) name='red' ;;
3) name='green' ;;
4) name='blue' ;;
5) name='purple' ;;
6) name='black' ;;
esac 
echo $name
}

echo
color=$(color_name $BG1)
if [ $flag_bg1 -eq 1 ] 
  then
  BG1='default'
fi
echo "Column 1 background = $BG1 ($color)"

color=$(color_name $TEXT1)
if [ $flag_text1 -eq 1 ] 
  then
  TEXT1='default'
fi
echo "Column 1 font color = $TEXT1 ($color)"

color=$(color_name $BG2)
if [ $flag_bg2 -eq 1 ] 
  then
  BG2='default'
fi
echo "Column 2 background = $BG2 ($color)"

color=$(color_name $TEXT2)
if [ $flag_text2 -eq 1 ] 
  then
  TEXT2='default'
fi
echo "Column 2 font color = $TEXT2 ($color)"

