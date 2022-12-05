#!/bin/bash

isRunning=true
while [ isRunning ]; do
    bucket=""
    echo "What bucket would you like to delete? "
    read bucket
    if [ "$bucket" = "" ]
    then
        isRunning=false
        exit
    fi
    aws s3 rb s3://$bucket --force
done