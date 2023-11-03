#!/bin/bash

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then    
        echo "$2 ::Installation........$R FAILURE $N"
        exit 1
    else
        echo "$2 ::Installation .......$G SUCCESS $N"
    fi
}

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error::: Please  run this script with root"
    exit 1
fi

yum install mysql -y &>>$LOGFILE

VALIDATE $? "Installingn Mysql"

yum install postfix -y &>>$LOGFILE

VALIDATE $? "Installing Postfix"
