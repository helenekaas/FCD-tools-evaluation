#!/bin/bash

ROOT_DIR="/proc_data1/bd5/FCD-tools-evaluation"
MELD_GRAPH="${ROOT_DIR}/classifiers/meld_graph"
DATA_DIR="${ROOT_DIR}/derivatives/meld_graph"
mkdir -p ${MELD_GRAPH}/tmp
cd ${MELD_GRAPH}/meld_graph-repo

apptainer exec \
    -H ${MELD_GRAPH}/meld_graph-repo \
    --bind ${DATA_DIR}:/data \
    --bind ${MELD_GRAPH}/license.txt:/license.txt \
    --bind ${MELD_GRAPH}/tmp:/tmp \
    --env FS_LICENSE=/license.txt \
    --nv \
    --fakeroot \
    --writable \
    ${MELD_GRAPH}/meld_graph-sandbox \
    bash