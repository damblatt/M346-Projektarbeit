#!/bin/bash

source config.sh
# source createRole.sh

aws lambda create-function \
    --function-name $functionName
    echo $runtime
    echo $roleARN
    --runtime $runtime
    --role $roleARN