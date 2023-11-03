#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error :: Please run this script with root user"
    exit 1
fi
yum install mysqlll -y
# it is our responsibility again to check installation is success or not
#need to check exit status
# exit status is 0 means previous command is success 
# if exit status is other than 0 then previous command is failure

if [ $? -ne 0 ]
then
    echo "Installation is error"
    exit 1
else
    echo "Installation is success"
fi