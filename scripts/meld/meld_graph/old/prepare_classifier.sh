
#!/bin/bash

if [ ! -d "${DERIVATIVES_DIR=}/meld_graph_harmo/models" ]; then
	echo "${DERIVATIVES_DIR=}/meld_graph_harmo/models"
	echo "HARMO"
	# apptainer exec \
	# 	--bind $1:/data \
	# 	${MELD_GRAPH_APPTAINER_IMAGE=} \
	# 	python /app/scripts/new_patient_pipeline/prepare_classifier.py \
	# 	--force-download
fi

if [ ! -d "${DERIVATIVES_DIR=}/meld_graph_noharmo/models" ]; then
	echo "NO HARMO"
	# apptainer exec \
	# 	--bind $1:/data \
	# 	${MELD_GRAPH_APPTAINER_IMAGE=} \
	# 	python /app/scripts/new_patient_pipeline/prepare_classifier.py \
	# 	--force-download
fi
