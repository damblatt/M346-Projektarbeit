#!/bin/bash

source config.sh
# source createRole.sh
aws lambda create-function \
    --function-name $functionName \
    --runtime $runtime \
    --zip-file fileb://zipFile.zip \
    --role $roleARN