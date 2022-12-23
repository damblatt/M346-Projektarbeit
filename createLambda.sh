#!/bin/bash

source config.sh
# source createRole.sh
aws lambda create-function \
    --function-name $functionName \
    --runtime $runtime \
    --handler $handler \
    --zip-file fileb://zipFile.zip \
    --role $roleARN

echo "> Preparing lambda function..."
zip func.zip func.js > /dev/null

echo "> Creating lambda function..."
aws lambda create-function --function-name $functionName --zip-file fileb://func.zip --handler $handler --runtime nodejs16.x --role $roleARN > /dev/null