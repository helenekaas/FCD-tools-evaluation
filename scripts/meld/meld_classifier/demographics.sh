#!/bin/bash

apptainer exec --home ${ROOT_DIR} \
    --bind ${ROOT_DIR}:${ROOT_DIR} \
    ${PREPROC_IMAGE} \
    python src/meld/demographics_file_meld_classifier.py \
    --sequences_xlsx lists/sequences_QCed_all_scans.xlsx \
    --meld_dir derivatives/meld_classifier
