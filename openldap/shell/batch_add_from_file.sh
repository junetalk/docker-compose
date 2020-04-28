#!/bin/bash

while read line
do
    ./add_user.sh $line
done < one.txt
