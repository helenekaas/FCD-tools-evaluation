#!/bin/bash

apptainer \
	run \
    --bind ${ROOT_DIR}:${ROOT_DIR} \
	--bind ${BIDS_DIR}:/bids \
	--bind ${DEEP_FCD_DERIVATIVES_DIR=}:/derivatives \
    --bind ${ROOT_DIR}/src/deepFCD/deepFCD_to_native.py:/src/deepFCD_to_native.py \
	${DEEP_FCD_APPTAINER_IMAGE} \
    python /src/deepFCD_to_native.py \
    --data_dir /bids \
    --deepFCD_dir /derivatives \
    --verbose 2

	