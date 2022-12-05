#!/bin/bash
# Projektarbeit 'Bildverkleinerung', M346
# Autoren: Blatt Damian, Bruelisauer Manuel, Inauen Maurin

isRunning=true
while [ isRunning ]; do
    bucket=""
    echo "Enter the name for your new bucket: "
    read bucket
    if [ "$bucket" = "" ]
    then
        isRunning=false
        exit
    fi
    aws s3 mb s3://$bucket
done