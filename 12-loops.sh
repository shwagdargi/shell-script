#!/bin/bash

DATE=$(date +%F)
LOGSDIR=/home/centos/shellscript-logs

SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$0-$DATE.log
USERID=$(id -u)
R="\e[31m"
N="\e[@m"
Y="\e[33m"

if [ $USERID -ne 0 ]
then
    echo -e"$R Error :: Please run this script with roota acce $N"
    exit 1
fi

VALIDATE() {
    if [ $1 -ne 0 ]
    then
        echo -e "Installing $2 ... $R FAILURE $N"
        exit 1
    else
        echo -e "Installing $2 ...$g SUCESS $N"
    fi 
}
for i in $@
do
    yum list installed $i &>> $LOGFILE 
    if [ $? -ne 0 ]
    then
        echo "$i is not installed, let install it"
        yum install $i -y &>> $LOGFILE
        VALIDATE $? "$i" 
    else
        echo -e "$Y $i is already installed $N"
    fi

done
