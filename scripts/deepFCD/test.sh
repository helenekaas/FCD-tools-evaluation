#!/bin/bash

# Set comma as the delimiter
IFS=','

while read subject_session; do
	# Read the string into two variables
	read subject session <<< "$subject_session"
    echo "sub-$subject ses-$session"
done < $1