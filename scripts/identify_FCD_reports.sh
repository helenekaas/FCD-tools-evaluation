#!/bin/bash

# For debugging text_utils
# --bind /proc_data1/bd5/text_utils/src/text_utils/text_utils.py:/venv/lib/python3.10/site-packages/text_utils/text_utils.py \

apptainer run \
	--net --network none \
	-H /proc_data1/bd5:/bd_wp5 \
	--bind /usr/local/cuda-12.3/lib64:/cuda-12.3/lib64 \
	--env LD_LIBRARY_PATH=/cuda-12.3/lib64 \
	--env PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True \
	preproc.sif \
	/bd_wp5/FCD-tools-evaluation/src/identify_FCD_reports.py \
	--text_csv /bd_wp5/PACS_data/mri_reports_epilepsy/anonym_sentences.csv \
	--out_csv /bd_wp5/FCD-tools-evaluation/lists/FCD_reports.csv