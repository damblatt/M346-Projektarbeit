#!/bin/bash

isRunning=true
while [ isRunning ]; do
    file=""
    echo "What file would you like to delete? "
    read file
    if [ "$file" = "" ]
    then
        isRunning=false
        exit
    fi
    rm $file
done