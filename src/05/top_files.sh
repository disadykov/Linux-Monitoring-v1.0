#!/bin/bash
#Top 10 files with largest size in descending order (path, size and type)
#Top 10 executable files with largest size in descending order (path, size and hash)

PATH_PARAM=$1
BOLD_START='\033[1m'
BOLD_END_CLEAR='\033[0m'

echo -e $BOLD_START"TOP 10 files of maximum size arranged in descending order (path, size and type): $BOLD_END_CLEAR"

count_files=$(find $PATH_PARAM -type f | wc -l)
if [[ $count_files -ge 10 ]]; then
	count_files=10
fi
for (( i=1; i <= $count_files; i++ ))
do
	maximum_size="$(find $PATH_PARAM -type f -exec du -h '{}' + | sort -hr | nl | head -$i | tail -1 | awk '{print $1" - "$3", "$2}')"
	echo -n $maximum_size
	filename="$(find $PATH_PARAM -type f -exec du -h '{}' +  | sort -hr | head -$i | tail -1 | awk '{print $2}')"
	type=$(echo $filename | grep -o "\.\w*$" | tr "." " ")
	echo ",$type"
done


echo -e $BOLD_START"TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file): $BOLD_END_CLEAR"
count_files=$(find $PATH_PARAM -type f -perm /a=x | wc -l)
if [[ $count_files -ge 10 ]]; then
	count_files=10
fi
for (( i=1; i <= $count_files; i++ ))
do
	maximum_size=$(find $PATH_PARAM -type f -perm /a=x -exec du -h '{}' + | sort -hr | nl | head -$i | tail -1 | awk '{print $1" - "$3", "$2}')
	echo -n $maximum_size
	filename=$(find $PATH_PARAM -type f -perm /a=x -exec du -h '{}' + | sort -hr | head -$i | tail -1 | awk '{print $2}' | md5sum | awk '{print $1}')
	echo ", $filename"
done
