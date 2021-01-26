#!/bin/bash


#Short commands and variable
e1="Enabled"
d1="Disabled"
version=`aws s3api get-bucket-versioning --bucket $1|jq -r '.Status'`
aws s3api get-bucket-encryption --bucket $1 > /dev/null 2>&1
exit_stat=$?
#encryption=`aws s3api get-bucket-encryption --bucket $1|grep -i rules | cut -d':' -f1 |tr -s '  ' | cut -c1-7|cut -c3-`
logging=`aws s3api get-bucket-logging --bucket $1 |jq -r '.LoggingEnabled' |jq -r '.TargetBucket'`
transfer=`aws s3api get-bucket-accelerate-configuration --bucket $1 | jq -r '.Status'`
location=`aws s3api get-bucket-location --bucket $1 | jq -r '.LocationConstraint'`
public=`aws s3api get-public-access-block --bucket $1 | jq -r '.PublicAccessBlockConfiguration' | jq -r '.RestrictPublicBuckets'`

#Bucket Details
echo "Bucket Name: $1 "
echo "Bucket Region: $location"


#Checking Versioning
if [ "$version" == "Enabled" ]
then

        echo "Bucket Versioning : $e1"
else
        echo "Bucket Versioning : $d1"
fi

#Checking Encrption

if [ $exit_stat == 0 ];then

      
	echo "Default encryption : $e1"

	
elif [ $exit_stat == 255 ];then


	echo "Default encryption : $d1"

else
	echo "Default encryption : Unknown"
fi

#Checking Logging enabled

if [ "$logging" == "$1" ]
then

        echo "Bucket Logging : $e1"
else
	echo "Bucket Logging : $d1"
fi

#Other propertions checking


if [ "$transfer" == "Enabled" ]
then

        echo "Transfer acceleration : $e1"
else
	echo "Transfer acceleration : $d1"
fi

#Public Access 


if [ "$public" == "true" ]
then
	echo "Public access : $d1"
else
	echo "Public access : $e1"
fi
