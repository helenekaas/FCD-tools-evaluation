#!/bin/bash

# usage: bash DK_reporting.sh <SUBJECTS_SESSION_CSV> <OUTPUT_DIR>

mkdir -p $2

# Set comma as the delimiter
IFS=','

while read subject_session; do
    read subject session <<< "${subject_session}"
	LOG_FILE="$2/sub-${subject}_ses-${session}.txt"
	if [ -e "${LOG_FILE}" ]; then
		echo "File ${LOG_FILE} exists. Skipping."
	else
		cmd="${ROOT_DIR}/scripts/deepFCD/deepFCD_reporting.sh \
			${ROOT_DIR}/src/deepFCD/deepFCD_reporting.py \
			desikan_killiany \
			${DEEP_FCD_DERIVATIVES_DIR} \
			sub-${subject}_ses-${session} \
			| tee ${LOG_FILE}"
		echo $cmd
		eval $cmd
	fi
done < $1