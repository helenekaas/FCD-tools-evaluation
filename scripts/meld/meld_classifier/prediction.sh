#!/bin/bash

cd ${MELD_CLASSIFIER_DERIVATIVES}

if [ ! -d "${MELD_CLASSIFIER_DERIVATIVES}/models" ]; then
    apptainer exec --home ${MELD_CLASSIFIER_DERIVATIVES} \
        --bind ${MELD_CLASSIFIER_DERIVATIVES}:/data \
        ${MELD_CLASSIFIER_APPTAINER_IMAGE} \
        python /opt/meld_classifier/scripts/prepare_classifier.py
fi


while IFS= read -r subject; do
    pdf_file="${MELD_CLASSIFIER_DERIVATIVES}/output/predictions_reports/${subject}/reports/MELD_report_${subject}.pdf"
    if [[ ! -f "${pdf_file}" ]]; then
        apptainer exec \
            --home ${MELD_CLASSIFIER_DERIVATIVES}:/data \
            --bind ${ROOT_RIT}:${ROOT_DIR} \
            --bind ${freesurfer_dir}/license:/fs_license/license.txt \
            --bind ${MELD_CLASSIFIER_DERIVATIVES}:/tmp \
            ${MELD_CLASSIFIER_APPTAINER_IMAGE} \
            python /opt/meld_classifier/scripts/new_patient_pipeline/new_pt_pipeline.py \
            -site H68 \
            -id $subject
    else
        echo "Report for ${subject} exists. Skipping."
    fi
done < "${ROOT_DIR}/lists/meld_subjects_list_all.txt"
