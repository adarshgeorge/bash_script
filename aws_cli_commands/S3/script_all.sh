#!/bin/bash

for i in `aws s3 ls | cut -c21-250` ;do ./script.sh $i ; done
