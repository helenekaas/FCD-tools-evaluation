
#!/bin/bash

MELD_GRAPH="/proc_data1/bd5/FCD-tools-evaluation/classifiers/meld_graph"
DATA_DIR="/proc_data1/bd5/FCD-tools-evaluation/derivatives/meld_graph"
mkdir -p ${MELD_GRAPH}/tmp
cd ${MELD_GRAPH}/meld_graph-repo

apptainer exec \
	-H ${MELD_GRAPH}/meld_graph-repo \
	--bind ${DATA_DIR}/data:/data \
	--bind ${MELD_GRAPH}/license.txt:/license.txt \
	--bind ${MELD_GRAPH}/tmp:/tmp \
	--env FS_LICENSE=/license.txt \
	--nv \
	${MELD_GRAPH}/meld_graph.sif \
	pytest