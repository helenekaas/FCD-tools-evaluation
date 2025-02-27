#!/bin/bash

# For debugging text_utils
# --bind /proc_data1/bd5/text_utils/src/text_utils/text_utils.py:/venv/lib/python3.10/site-packages/text_utils/text_utils.py \

apptainer run \
	--net --network none \
	-H /proc_data1/bd5:/bd_wp5 \
	preproc.sif \
	/bd_wp5/FCD-tools-evaluation/src/associate_CPR.py \
	--cpr_id_pairing /bd_wp5/SP_data/CPR-ID_pairing.csv.tar.gpg \
	--out_csv /bd_wp5/FCD-tools-evaluation/CPR_matching.csv \
	--subjects /bd_wp5/FCD-tools-evaluation/$1