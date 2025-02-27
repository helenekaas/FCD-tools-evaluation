#!/bin/bash

mkdir -p ${DERIVATIVES_DIR}/recons/QC

apptainer exec \
	--net --network none \
    -B ${DERIVATIVES_DIR}/recons:/data \
    -B ${DERIVATIVES_DIR}/recons/QC:/out \
    -B ${ROOT_DIR}/lists/subjects_sessions_list_all.txt:/data/subjects_list \
    ${FS_QC_APPTAINER_IMAGE} \
    /app/fsqc/run_fsqc \
    --subjects-file /data/subjects_list \
    --subjects_dir /data \
    --output_dir /out \
    --screenshots-html \
    --surfaces-html \
    --fornix-html \
    --outlier