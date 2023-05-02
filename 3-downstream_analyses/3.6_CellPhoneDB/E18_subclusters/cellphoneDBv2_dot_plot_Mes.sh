#!/bin/bash

#
# CellPhoneDB
#

## Run CellPhoneDB v2 dotplot function specifying colums of clusters


for i in {0..11}
do
	echo "Cluster $i file"
	cellphonedb plot dot_plot \
		--means-path ./out/means_fixorder.txt \
		--pvalues-path ./out/pvalues_fixorder.txt \
		--output-path ./plots \
		--columns ./in/mes_cluster_${i}_cols.txt \
		--output-name mes_cluster_${i}_interactions.pdf
done

