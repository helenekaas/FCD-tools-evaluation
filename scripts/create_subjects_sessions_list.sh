#!/bin/bash

apptainer exec --home ${ROOT_DIR} \
    --bind ${ROOT_DIR}:${ROOT_DIR} \
    ${PREPROC_IMAGE} \
    python src/create_subjects_sessions_list.py \
    --info_xlsx "${ROOT_DIR}/lists/all_patients_demograph (3).xlsx" \
    --sequences_xlsx ${ROOT_DIR}/lists/sequences_QCed_all_scans.xlsx \
    --out_file ${ROOT_DIR}/lists/subjects_sessions_list_harmonization.txt \
    --out_csv ${ROOT_DIR}/lists/subjects_sessions_list_harmonization.csv \
    --harmonization

apptainer exec --home ${ROOT_DIR} \
    --bind ${ROOT_DIR}:${ROOT_DIR} \
    ${PREPROC_IMAGE} \
    python src/create_subjects_sessions_list.py \
    --info_xlsx "${ROOT_DIR}/lists/all_patients_demograph (3).xlsx" \
    --sequences_xlsx ${ROOT_DIR}/lists/sequences_QCed_all_scans.xlsx \
    --out_file ${ROOT_DIR}/lists/subjects_sessions_list_all.txt \
    --out_csv ${ROOT_DIR}/lists/subjects_sessions_list_all.csv
