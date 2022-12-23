#!/bin/bash

source config.sh
# source createRole.sh
# create lambda function
aws lambda create-function \
    --function-name $functionName \
    --runtime $runtime \
    --handler $handler \
    --zip-file fileb://zipFile.zip \
    --role $roleARN

# create S3-Trigger
aws lambda create-event-source-mapping \
  --function-name $functionName \
  --event-source-arn arn:aws:s3:::$firstBucketName \
  --batch-size 1 \
  --starting-position "LATEST"
