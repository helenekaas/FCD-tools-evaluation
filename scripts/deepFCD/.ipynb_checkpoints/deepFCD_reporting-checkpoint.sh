#!/bin/bash

# usage: bash deepFCD_reporting.sh \
#				<REPORTING_SCRIPT> \
#				<ATLAS> \
#				<DERIVATIVES_DIR> \
#				<SUBJECT>

apptainer \
	run \
	--bind $1:/app/utils/reporting.py \
	--bind $3:/io \
	${DEEP_FCD_DIR}/deepFCD-v1.1.9.sif \
	/app/utils/reporting.py $2 $4 /io