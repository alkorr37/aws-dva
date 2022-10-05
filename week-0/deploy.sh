stackName=week0-ec2Single

#aws cloudformation delete-stack --stack-name $stackName
aws cloudformation deploy \
  --template-file ./templates/ec2-single.json \
  --stack-name $stackName

ipaddr=`aws cloudformation describe-stacks \
  --stack-name $stackName \
  --query "Stacks[0].Outputs[0].OutputValue"`

echo Public IP: $ipaddr
