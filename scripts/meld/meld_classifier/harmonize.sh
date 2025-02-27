#!/bin/bash

cd ${MELD_CLASSIFIER_DERIVATIVES}

if [ ! -d "${MELD_CLASSIFIER_DERIVATIVES}/models" ]; then
    apptainer exec --home ${MELD_CLASSIFIER_DERIVATIVES} \
        --bind ${MELD_CLASSIFIER_DERIVATIVES}:/data \
        ${MELD_CLASSIFIER_APPTAINER_IMAGE} \
        python /opt/meld_classifier/scripts/prepare_classifier.py
fi

cmd="apptainer exec \
    --home ${MELD_CLASSIFIER_DERIVATIVES}:/data \
    --bind ${ROOT_RIT}:${ROOT_DIR} \
    --bind ${freesurfer_dir}/license:/fs_license/license.txt \
    --bind ${MELD_CLASSIFIER_DERIVATIVES}:/tmp \
    --bind ${ROOT_DIR}/lists/meld_subjects_list_harmonization.txt/:/data/subjects_list_harmonization.txt \
    ${MELD_CLASSIFIER_APPTAINER_IMAGE} \
    python /opt/meld_classifier/scripts/new_patient_pipeline/new_pt_pipeline.py \
    -site H68 \
    -ids /data/subjects_list_harmonization.txt \
    -demos /data/demographics_file.csv"

$cmd
