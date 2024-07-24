#!/bin/bash

Date=$(date +%F)
ScriptName=$0
LogsDir=/ShellScripts/
LogFile=$LogsDir/$0-$Date.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
ID=$(id -u)

validate()
{
    if [ $1 -ne 0]
    then
        echo -e "Installing $2 ... $R FAILURE $N"
        exit 1
    else
        echo -e "Installing $2 ... $G SUCCESS $N"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R You are not authorized to perform this action $N" &>>$LogFile
    exit 1
else
    for i in $@
    do
        yum list installed $i &>>LogFile
        if [ $? -ne 0 ]
        then
            echo -e "$G $i is not installed yet, Installing now $N"
            yum install $i -y &>>$LogFile
            validate $? "$i"
        else
            echo -e "$Y $i is already installed $N" &>>LogFile
        fi
    done
fi
    