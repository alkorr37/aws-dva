stackName=week1-ec2ASG

#aws cloudformation delete-stack --stack-name $stackName
aws cloudformation deploy \
  --template-file ./templates/ec2-asg.json \
  --stack-name $stackName
