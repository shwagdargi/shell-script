#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $? -ne 0 ]
    then    
        echo "$2........FAILURE"
        exit 1
    else
        echo "$2 .......SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Error::: Please  run this script with root"
    exit 1
fi

yum install mysql -y

VALIDATE $? "Installingn Mysql"

yum install postfix -y

VALIDATE $? ""Installing Postfix"
