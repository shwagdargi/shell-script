#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then    
        echo "$2 ::Installation........FAILURE"
        exit 1
    else
        echo "$2 ::Installation .......SUCCESS"
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

VALIDATE $? "Installing Postfix"
