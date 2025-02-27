#!/bin/bash

# For debugging text_utils
# --bind /proc_data1/bd5/text_utils/src/text_utils/text_utils.py:/venv/lib/python3.10/site-packages/text_utils/text_utils.py \

apptainer run \
	--net --network none \
	--nv \
	-H /proc_data1/bd5:/bd_wp5 \
	preproc.sif \
	/bd_wp5/FCD-tools-evaluation/src/identify_subjects_with_multiple_neuronav_scans.py \
	--bd5_dir /bd_wp5 \
	"$@"