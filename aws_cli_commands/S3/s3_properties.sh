#!/bin/bash


#Short commands and variable

version=`aws s3api get-bucket-versioning --bucket $1|jq -r '.Status'`
encryption=`aws s3api get-bucket-encryption --bucket $1 | grep -Fq "ServerSideEncryptionConfigurationNotFoundError"`
e1="Enabled"
logging=`aws s3api get-bucket-logging --bucket $1 |jq -r '.LoggingEnabled' |jq -r '.TargetBucket'`
transfer=`aws s3api get-bucket-accelerate-configuration --bucket $1 | jq -r '.Status'`
location=`aws s3api get-bucket-location --bucket $1 | jq -r '.LocationConstraint'`
public=` aws s3api get-public-access-block --bucket $1 | jq -r '.PublicAccessBlockConfiguration' | jq -r '.RestrictPublicBuckets'`

echo "Bucket Name: $1 "
echo "Bucket Region: $location"


#Checking Versioning
if [ "$version" == "$e1" ]
then

        echo "Bucket Versioning : Enabled"
else
        echo "Bucket Versioning : Disabled"
fi

#Checking Encrption

if [  $encryption != " " ] ; then
	echo "Default encryption : Enabled"
else
	echo "Default encryption : Disabled"
fi

#Checking Logging enabled

if [ "$logging" == "$1" ]
then

        echo "Bucket Logging : Enabled"
else
	echo "Bucket Logging : Disabled"
fi

#Other propertions checking


if [ "$transfer" == "$e1" ]
then

        echo "Transfer acceleration : Enabled"
else
	echo "Transfer acceleration : Disabled"
fi

#Public Access 


if [ "$public" == "true" ]
then
	echo "Public access : Yes"
else
	echo "Public access : No"
