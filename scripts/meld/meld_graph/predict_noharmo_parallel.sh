#!/bin/bash

# There are unexpected issues when running multiple instances in parallel,
# the PDF report doesn't get created. There using --n_jobs 1.

python src/meld/parallel_meld_graph.py \
    --subjects_list ${ROOT_DIR}/lists/meld_subjects_list_all.txt \
    --n_jobs 1