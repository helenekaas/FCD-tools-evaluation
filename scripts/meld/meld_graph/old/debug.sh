#!/bin/bash

ROOT_DIR="/proc_data1/bd5/FCD-tools-evaluation"
MELD_GRAPH="${ROOT_DIR}/classifiers/meld_graph"
DATA_DIR="${ROOT_DIR}/derivatives/meld_graph_H68"
RAW_DIR="/proc_data1/bd5/FCD-tools-evaluation/data/raw"
mkdir -p ${MELD_GRAPH}/tmp
cd ${MELD_GRAPH}/meld_graph-repo

apptainer exec \
    -H ${MELD_GRAPH}/meld_graph-repo \
    --bind ${DATA_DIR}:/data \
    --bind ${MELD_GRAPH}/license.txt:/license.txt \
    --bind ${MELD_GRAPH}/tmp:/tmp \
    --bind ${RAW_DIR}:${RAW_DIR} \
    --env FS_LICENSE=/license.txt \
    --nv \
    ${MELD_GRAPH}/meld_graph.sif \
    bash