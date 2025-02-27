#!/bin/bash

cd ${MELD_GRAPH}/meld_graph-repo

apptainer exec \
    -H ${MELD_GRAPH}/meld_graph-repo \
    --bind ${DATA_DIR}:/data \
    --bind ${MELD_GRAPH}/license.txt:/license.txt \
    --bind ${MELD_GRAPH}/tmp:/tmp \
    --bind ${ROOT_DIR}:${ROOT_DIR} \
    --env FS_LICENSE=/license.txt \
    --nv \
    ${MELD_GRAPH}/meld_graph-21-11-2024.sif \
    python /app/scripts/new_patient_pipeline/new_pt_pipeline.py \
    -harmo_code H68 \
    -ids /data/input/subjects_ids.txt \
    -demos /data/demographics_file_H68.csv \
    --harmo_only \
    --debug_mode