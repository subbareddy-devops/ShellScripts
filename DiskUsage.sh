#!/bin/bash

Date=$(date +%F)
ScriptName=$0
LogsDir=D/repos/subbushell
LogFile=$LogsDir/$ScriptName-$Date.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
Thresshold=20
message=""
DiskUsage=$(df -hT | grep ntfs)

While IFS= read line
do
    Usage=$(echo $line | grep -o '\w*%')
    echo "$DiskUsage"
    FileSystem=$(echo $line | awk '{print $1}')
    echo "$FileSystem"

    if [ $Usage -gt $Thresshold ]
    then
        message+="High Disk Usage on $FileSystem : $Usage"
    fi
done <<< $DiskUsage
echo -e "message: $message"