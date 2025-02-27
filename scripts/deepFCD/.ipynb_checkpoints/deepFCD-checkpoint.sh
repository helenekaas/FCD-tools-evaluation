#!/bin/bash

${ROOT_DIR}/src/deepFCD/deepFCD_bids.py \
	--sif_image ${DEEP_FCD_APPTAINER_IMAGE} \
	--subjects_sessions_list ${ROOT_DIR}/lists/subjects_sessions_list_all.csv \
	--bids_dir ${BIDS_DIR} \
	--derivatives_dir ${DEEP_FCD_DERIVATIVES_DIR} \
	--t1_sequence_str _acq-t1-mpr-sag-iso-neuronav \
	--flair_sequence_str _acq-t2-spc-da-fl-irprep-sag-p2-iso
