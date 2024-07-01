#!/bin/bash
#Total number of files
#Number of configuration files (with .conf extension), text files, executable files, log files (files with .log extension), archives, symbolic links

PATH_PARAM=$1
BOLD_START='\033[1m'
BOLD_END_CLEAR='\033[0m'

file_count=`find $PATH_PARAM -type f | wc -l`
echo -e $BOLD_START"Total number of files = $BOLD_END_CLEAR$file_count"

echo -e $BOLD_START"Number of:  $BOLD_END_CLEAR"

file_conf=`find $PATH_PARAM -type f -name "*.conf" | wc -l`
echo -e $BOLD_START"Configuration files (with the .conf extension) = $BOLD_END_CLEAR$file_conf"

file_text=`find $PATH_PARAM -type f -name "*.txt" | wc -l`
echo -e $BOLD_START"Text files = $BOLD_END_CLEAR$file_text"

exec_file=`find $PATH_PARAM -type f -perm /a=x | wc -l`
echo -e $BOLD_START"Executable files = $BOLD_END_CLEAR$exec_file"

log_file=`find $PATH_PARAM -type f -name "*.log" | wc -l`
echo -e $BOLD_START"Log files (with the extension .log) = $BOLD_END_CLEAR$log_file"

#tmp=`find $PATH_PARAM -type f -regex ".*\.\(7z\|arj\|bin\|cab\|cbr\|deb\|exe\|gz\|gzip\|jar\|one\|pak\|pkg\|ppt\|rar\|rpm\|sh\|sib\|sis\|sisx\|sit\|sitx\|spl\|tar\|tar-gz\|tgz\|xar\|zip\|zip\|zipx\|text\)"`
tmp=`find $PATH_PARAM -type f`
archive_file=`file $tmp | grep archive | wc -l`
echo -e $BOLD_START"Archive files = $BOLD_END_CLEAR$archive_file"

links_file=`find $PATH_PARAM -type l | wc -l`
echo -e $BOLD_START"Symbolic links = $BOLD_END_CLEAR$links_file"