#!/bin/bash
# set n to 1
n=1

# continue until $n equals 5
while [ $n -le 2 ]
do
        echo "Downloading $n times."
        wget http://nycmetro-speedtest.reliablesite.net/1000mb.test.zip
        n=$(( n+1 ))     # increments $n
done
