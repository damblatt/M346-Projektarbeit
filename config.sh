#!/bin/bash

firstBucketName="m347-testbucketnr1"
secondBucketName="m347-testbucketnr2"
functionName="m347-function"
runtime="python3.9"
roleARN=$(aws iam get-role --role-name LabRole | grep Arn | awk -F '"' '{print $4}') # Gets role named 'LabRole' and filters the output to get the Arn
# lambdaPolicySource="lambdaPolicy.json"
zip zipFile function.js # creates zip-file containing function.js