#!/bin/bash
 
DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
AWS_SECRET=$4
BUCKET_NAME=$5

DATE=$(date +%H-%M-%S)
BACKUP=$DB_NAME-$DATE.sql

mysqldump -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /tmp/$BACKUP && \
export AWS_ACCESS_KEY_ID=AKIAREIM6KOJSXMU4HXX && \
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET && \
echo "Uploading your $BACKUP backup" && \
aws s3 cp /tmp/$BACKUP s3://$BUCKET_NAME/$BACKUP

