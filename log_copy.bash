#! /bin/bash 

 
 

LAST_HOUR="$(( $(date +%l)- 1 ))" 

 
 

if [ $LAST_HOUR -lt 10 ]; then 

  LAST_HOUR="0$LAST_HOUR" 

fi 

SEARCH_STRING=$(date +"%b-%d-%Y-${LAST_HOUR}:") 

echo $SEARCH_STRING 

cat logs/Server_Info.log | grep "${SEARCH_STRING}" 2>>logs/Server_Hourly.log 

 
 

 
