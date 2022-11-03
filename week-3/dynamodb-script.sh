#!/bin/bash
TABLE_NAME=Test
REGION=us-west-2

aws dynamodb list-tables --region $REGION

aws dynamodb put-item \
  --region $REGION \
  --table-name $TABLE_NAME \
  --item \
  '{
      "UserId": {
          "S": "1"
      },
      "Age": {
          "N": "30"
      },
      "Email": {
        "S": "test1@test.com"
      }
  }'

aws dynamodb put-item \
  --region $REGION \
  --table-name $TABLE_NAME \
  --item \
  '{
      "UserId": {
          "S": "2"
      },
      "Age": {
          "N": "32"
      },
      "Email": {
        "S": "test2@test.com"
      }
  }'

aws dynamodb scan \
  --region $REGION \
  --table-name $TABLE_NAME