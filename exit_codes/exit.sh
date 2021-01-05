#!/bin/bash

cat file.txt 

if [ $? -eq 0 ]
then
  echo "The script ran ok"
  exit 0
else
  echo "The script failed" >&2
  oexit 1
fi
