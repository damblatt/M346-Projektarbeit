firstBucketName="m347-testbucketnr1"
secondBucketName="m347-testbucketnr2"
functionName="m347-function"
runtime="python3.9"
roleName="m347-role"
roleARN= aws iam get-role --role-name $roleName
lambdaPolicySource="lambdaPolicy.json"