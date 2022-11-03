#!/bin/bash
aws s3 cp s3://${bucketName}/${rdsFile} /home/ec2-user
aws s3 cp s3://${bucketName}/${dynamoFile} /home/ec2-user
chmod +x /home/ec2-user/${dynamoFile}

amazon-linux-extras enable postgresql13
yum install -y postgresql
