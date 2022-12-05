firstBucketName="m347-testbucketnr1"
secondBucketName="m347-testbucketnr2"
functionName="m347-function"
runtime="python3.9"
roleARN= aws iam get-role --role-name $roleName --query 'Role.[RoleName, Arn]' --output text #funktioniert noch nicht
# lambdaPolicySource="lambdaPolicy.json"