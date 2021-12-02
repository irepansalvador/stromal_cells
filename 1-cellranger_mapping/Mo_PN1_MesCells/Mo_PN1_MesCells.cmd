#!/bin/bash
#SBATCH --job-name=Mo_PN1_MesCells

#SBATCH --mail-type=all        # send email when job begins, ends, or fails
#SBATCH --mail-user=irepan.salvador@cnag.crg.eu

#SBATCH --output=./log/%x.slurm.%J.out # location for output and error 
#SBATCH --error=./log/%x.slurm.%J.err


#SBATCH --cpus-per-task=24
#SBATCH --mem=64G

echo [`date "+%Y-%m-%d %T"`] starting job on $HOSTNAME

/scratch/groups/hheyn/software/cellranger/6.0.0/cellranger count --fastqs /scratch/devel/isalvador/stromal_cells/1-cellranger_mapping/Mo_PN1_MesCells --id Mo_PN1_MesCells --transcriptome=/scratch/groups/hheyn/data/reference/refdata-gex-mm10-2020-A/ --nosecondary --localcores 24 --localmem 64 ;

echo [`date "+%Y-%m-%d %T"`] job finished
