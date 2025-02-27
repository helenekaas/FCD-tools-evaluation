#!/bin/bash

apptainer exec --home ${ROOT_DIR} \
    --bind ${ROOT_DIR}:${ROOT_DIR} \
    ${PREPROC_IMAGE} \
    python src/meld/link_data.py \
    --subjects_sessions_list lists/subjects_sessions_all.csv \
    --images_dir ${BIDS_DIR} \
    --recons_dir ${RECONS_DIR} \
    --out_dir derivatives/meld_classifier