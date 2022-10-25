FILE=test.txt
BUCKET_NAME=alkor-r37-bucket
echo 'test file' > $FILE

aws s3api create-bucket \
    --bucket $BUCKET_NAME \
    --region us-west-2 \
    --create-bucket-configuration LocationConstraint=us-west-2

aws s3api put-bucket-versioning \
    --bucket $BUCKET_NAME \
    --versioning-configuration Status=Enabled

aws s3api put-object \
    --bucket $BUCKET_NAME \
    --key $FILE \
    --body $FILE

