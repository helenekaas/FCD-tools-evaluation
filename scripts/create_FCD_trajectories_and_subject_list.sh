#!/bin/bash

# For debugging text_utils
# --bind /proc_data1/bd5/text_utils/src/text_utils/text_utils.py:/venv/lib/python3.10/site-packages/text_utils/text_utils.py \

apptainer run \
	--net --network none \
	-H /proc_data1/bd5:/bd_wp5 \
	preproc.sif \
	/bd_wp5/FCD-tools-evaluation/src/create_FCD_trajectories_and_subjects_list.py \
	--queries_csv /bd_wp5/PACS_data/anonymized-queries-epilepsy.csv \
	--doccano_dir /bd_wp5/doccano \
	--out_subjects_list /bd_wp5/FCD-tools-evaluation/lists/initial_FCD_subjects_multi_scans \
	--out_trajectories /bd_wp5/FCD-tools-evaluation/lists/patient_history_sequence-t1_mpr_sag_iso_neuronav_to-verify