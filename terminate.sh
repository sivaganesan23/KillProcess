#!/bin/bash

LOG=/tmp/kill.log
EXIT_ON_KILL=true
read -p 'Process: ' name
read -p 'killat: ' time

PID=$(ps -ef | grep $name | awk '{print $2}')
ps -ef | grep $name | awk '{print $2}' &>>$LOG

  if [ $? -eq 0 ]; then
  echo -e "\n The process details "
  ps -p $PID 
  else
    echo -e "\nInvalid Process Name" 
  fi

current=$(date +"%T")
killat=$(date -d "+"$time" seconds" "+%T")
echo -e "\nCurrent time $current \nThe time target is $killat"

while : 
do
current=$(date +"%T")
echo $current  

  if [ "${killat}" == "${current}" ]
  then   
    kill -9 $PID   &>>$LOG
    if [ $? -eq 0 ]; then
        echo "Process $name have been successfully killed"  
        if [ $EXIT_ON_KILL == true ];then
        exit 0
        fi
    else
        echo -e "\nFailed to Kill process $name" 
        echo -e "\nMay be Invalid Process Name" 
        exit 1
    fi

  fi
sleep 2
done


                                                                                                                                                                             
