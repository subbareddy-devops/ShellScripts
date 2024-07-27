#!/bin/bash

LogsDir=/tmp
G="\e[32m"
R="\e[31m"
N="\e[0m"
#List=$(ls -l)
#Date=$(date +%F)
LogsPersist=$LogsDir/Persisted.log
LogsDel=$LogsDir/Deleted.log

Files_to_del=$(find $LogsDir -name "*.log" -mtime +15 -ls)
echo -e "$R $Files_to_del $N" &>> $LogsDel
find $LogsDir -name "*.log" -mtime +15 -delete

Files_to_persist=$(find $LogsDir -name "*.log" -mtime -15 -ls)
echo -e "$G $Files_to_persist $N" &>> $LogsPersist




#find ./ -name *.log -maxdepth 0 -type f -mtime +15 -ls 
#find *.log -maxdepth 0 -type f

#To list and verify first -ls: find /var/dtpdev/tmp/ -type f -mtime +15 -ls To delete -delete: find /var/dtpdev/tmp/ -type f -mtime +15 -delete