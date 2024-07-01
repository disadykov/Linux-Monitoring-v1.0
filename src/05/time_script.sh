#!/bin/bash
#Execution time of the script

start_sript=$1
BOLD_START='\033[1m'
BOLD_END_CLEAR='\033[0m'
end_time=`date +%s.%N`

execution_time=$( echo "$end_time - $start_sript" | bc -l )
if [ "$execution_time" \< "1" ]; then
	execution_time="0$execution_time"
fi
echo -e $BOLD_START"Script execution time (in seconds) = $BOLD_END_CLEAR$execution_time"