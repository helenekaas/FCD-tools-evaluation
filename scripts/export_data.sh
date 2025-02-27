#!/bin/bash

apptainer run \
	--net --network none \
    --bind ${ROOT_DIR}:/fcd \
    --bind ${SP_DATA_DIR}:/sp_data \
    --bind /mnt/bd_wp5_ext:/dicom \
	preproc.sif \
	/fcd/src/export_data.py \
    --cpr_id_pairing /sp_data/CPR-ID_pairing.csv.tar.gpg \
    --dicom_dir /dicom/cohort-2/dicoms/mri \
    --out_dir /fcd/data_hc \
    --population_csv /sp_data/anonymized_data/anonymized_population.csv.tar.gpg \
    --queries_csv /dicom/cohort-1/lists/epilepsy_queries_all_sessions_updated.csv \
    --subjects /fcd/lists/hc_harm \
    --out_sequences_csv ${ROOT_DIR}/lists/sequences_hc_harm.csv \

apptainer run \
	--net --network none \
    --bind ${ROOT_DIR}:/fcd \
    --bind ${SP_DATA_DIR}:/sp_data \
    --bind /mnt/bd_wp5_ext:/dicom \
	preproc.sif \
	/fcd/src/export_data.py \
    --cpr_id_pairing /sp_data/CPR-ID_pairing.csv.tar.gpg \
    --dicom_dir /dicom/cohort-2/dicoms/mri \
    --out_dir /fcd/data_hc \
    --population_csv /sp_data/anonymized_data/anonymized_population.csv.tar.gpg \
    --queries_csv /dicom/cohort-2/lists/queries_AET-HEIVNADC2.csv \
    --subjects /fcd/lists/hc_harm \
    --out_sequences_csv ${ROOT_DIR}/lists/sequences_hc_harm.csv \