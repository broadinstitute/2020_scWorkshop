#! /bin/bash

#$ -cwd
#$ -q broad
#$ -P regevlab
#$ -l os=RedHat7
#$ -l h_vmem=4g
#$ -pe smp 6
#$ -binding linear:6
#$ -l h_rt=30:00:00
#$ -e cellranger_vdj-3.1.0.err
#$ -o cellranger_vdj-3.1.0.out
#$ -R y

source /broad/software/scripts/useuse
reuse Python-2.7
reuse UGER
export PATH=/ahg/regevdata/users/orr/bin/cellranger-3.1.0:$PATH
cellranger vdj --id=E2_TCR --sample=E2-TCR-lib --reference=/ahg/regevdata/users/orr/data/genomes/refdata-cellranger-vdj-GRCh38-alts-ensembl-3.1.0 --fastqs=/ahg/regevdata/projects/GBM_Tcells/fastq/2019_08_28_genewiz_Tcell/E2_TCR --localmem=24
