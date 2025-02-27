#!/bin/bash

cd ${MELD_GRAPH_DIR}/meld_graph-repo
mkdir -p ${MELD_GRAPH_DIR}/tmp
OUT_DIR="${DERIVATIVES_DIR}/meld_graph_noharmo"
mkdir -p ${OUT_DIR}

if [ ! -d "${OUT_DIR}/models" ]; then
	apptainer exec \
		--bind ${OUT_DIR}:/data \
		${MELD_GRAPH_APPTAINER_IMAGE=} \
		python /app/scripts/new_patient_pipeline/prepare_classifier.py \
		--force-download \
        --skip-download-data
fi

apptainer exec \
    -H ${MELD_GRAPH_DIR}/meld_graph-repo \
    --bind ${OUT_DIR}:/data \
    --bind ${MELD_GRAPH_DIR}/license.txt:/license.txt \
    --bind ${MELD_GRAPH_DIR}/tmp:/tmp \
    --bind ${ROOT_DIR}:${ROOT_DIR} \
    --nv \
    ${MELD_GRAPH_DIR}/meld_graph-21-11-2024.sif \
    python /app/scripts/new_patient_pipeline/new_pt_pipeline.py \
    -id $1 \
    --debug_mode