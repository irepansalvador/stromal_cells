#!/bin/bash

#
# CellPhoneDB
#


# Running statistical analysis

## Define parameters
metadata_path="cpdb_metadata_human_E18.txt"
counts_path="cpdb_logcounts_human_E18.h5ad"

## Run CellPhoneDB v.2.0 in statistical analysis mode
cellphonedb method statistical_analysis \
    $metadata_path \
    $counts_path \
    --counts-data=gene_name \
    --iterations=1000 \
    --threads=6

## Run fixOrder.py script
python /home/irepan/Desktop/Github/stromal_cells/3-downstream_analyses/3.6_CellPhoneDB/utils/fixOrder.py out/means.txt > out/means_fixorder.txt
python /home/irepan/Desktop/Github/stromal_cells/3-downstream_analyses/3.6_CellPhoneDB/utils/fixOrder.py out/pvalues.txt > out/pvalues_fixorder.txt
python /home/irepan/Desktop/Github/stromal_cells/3-downstream_analyses/3.6_CellPhoneDB/utils/fixOrder.py out/significant_means.txt > out/significant_means_fixorder.txt



