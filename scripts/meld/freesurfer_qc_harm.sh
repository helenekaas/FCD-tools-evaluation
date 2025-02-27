#!/bin/bash

apptainer exec \
	--net --network none \
    -B ${DERIVATIVES_DIR}/recons:/data \
    -B ${DERIVATIVES_DIR}/recons/QC_harm:/out \
    -B ${ROOT_DIR}/lists/lists/meld_subjects_list_harmonization.txt:/data/subjects_list \
    ${FS_QC_APPTAINER_IMAGE} \
    /app/fsqc/run_fsqc \
    --subjects-file /data/subjects_list \
    --subjects_dir /data \
    --output_dir /out \
    --screenshots-html \
    --surfaces-html \
    --fornix-html \
    --outlier \
    --skip-existing
