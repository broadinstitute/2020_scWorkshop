#! /bin/bash

#$ -cwd
#$ -q broad
#$ -P regevlab
#$ -l os=RedHat7
#$ -l h_vmem=4g
#$ -pe smp 12
#$ -binding linear:12
#$ -l h_rt=30:00:00
#$ -e cellranger-3.1.0.err
#$ -o cellranger-3.1.0.out
#$ -R y
source /broad/software/scripts/useuse
reuse Python-2.7
reuse UGER
export PATH=/ahg/regevdata/users/orr/bin/cellranger-3.1.0:$PATH
cellranger count --id=E2_GEX --sample=E2-5-Lib --transcriptome=/ahg/regevdata/users/orr/data/genomes/refdata-cellranger-GRCh38-3.0.0 --chemistry=fiveprime --fastqs=/ahg/regevdata/projects/GBM_Tcells/fastq/2019_08_28_genewiz_Tcell/E2_GEX --localmem=48
