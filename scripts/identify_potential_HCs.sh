#!/bin/bash

# For debugging text_utils
# --bind /proc_data1/bd5/text_utils/src/text_utils/text_utils.py:/venv/lib/python3.10/site-packages/text_utils/text_utils.py \

apptainer run \
	--net --network none \
	--nv \
	-H ${WP5_DIR}:/bd_wp5 \
	-B ${NLP_MODEL}:/model \
	preproc.sif \
	/bd_wp5/FCD-tools-evaluation/src/identify_potential_HCs.py \
	--bd5_dir /bd_wp5 \
	--model_dir /model \
	"$@"