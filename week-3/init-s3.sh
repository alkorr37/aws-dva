BUCKET_NAME=alkor-r37-bucket
DYNAMO_FILE=dynamodb-script.sh
RDS_FILE=rds-script.sql

aws s3api create-bucket \
    --bucket $BUCKET_NAME \
    --region us-west-2 \
    --create-bucket-configuration LocationConstraint=us-west-2

aws s3api put-object \
    --bucket $BUCKET_NAME \
    --key $DYNAMO_FILE \
    --body $DYNAMO_FILE

aws s3api put-object \
    --bucket $BUCKET_NAME \
    --key $RDS_FILE \
    --body $RDS_FILE