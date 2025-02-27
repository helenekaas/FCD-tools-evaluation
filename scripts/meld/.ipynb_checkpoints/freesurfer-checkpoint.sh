#!/bin/bash

nice ${FS_SCRIPT} \
	-subjects_sessions_list $1 \
	-recon_all \
	-sif_image ${MELD_CLASSIFIER_APPTAINER_IMAGE} \
	-recon_dir ${DERIVATIVES_DIR}/recons \
	-bids_dir ${BIDS_DIR} \
	-flair \
	-t1_sequence_str _acq-t1-mpr-sag-iso-neuronav \
	-flair_sequence_str _acq-t2-spc-da-fl-irprep-sag-p2-iso \
	-apptainer_xargs "--bind `pwd`:/data" \
	-n_jobs 25
