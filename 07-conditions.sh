#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 10 ]
then
    echo "$NUMBER IS GREATER THAN 10"
else
    echo "$NUMBER IS LESS THAN 10"
fi