#!/bin/bash

source config.sh

aws lambda create-function \
    --function-name $functionName
    --runtime $runtime
    --role 