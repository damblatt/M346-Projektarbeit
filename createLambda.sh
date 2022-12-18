#!/bin/bash

source config.sh
# source createRole.sh
echo $roleARN \

aws lambda create-function \
    --function-name $functionName \
    --runtime $runtime \
    --code fileb://codeFile.sh \
    --role $roleARN