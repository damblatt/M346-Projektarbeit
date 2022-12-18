#!/bin/bash

source config.sh
# source createRole.sh

aws lambda create-function \
    echo $roleARN \
    --function-name $functionName \
    --runtime $runtime \
    --code fileb://codeFile.sh \
    --role $roleARN