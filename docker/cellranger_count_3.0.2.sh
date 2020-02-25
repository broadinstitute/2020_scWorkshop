#! /bin/bash

#$ -cwd
#$ -q broad
#$ -P regevlab
#$ -l h_vmem=4g
#$ -pe smp 12
#$ -binding linear:12
#$ -l h_rt=30:00:00
#$ -e logs/cellranger-2.1.0_C52.err
#$ -o logs/cellranger-2.1.0_C52.out
#$ -R y

source /broad/software/scripts/useuse
reuse Python-2.7
reuse UGER
export PATH=/usr/local/src/ellranger-3.0.2:$PATH


id=C52
newid="${id}_new"
sampid=${id}
transriptome_path=/broad/hptmp/kgosik/FASI_DOmice/cellranger/refdata-cellranger-mm10-2.1.0
# fastq_path=/ahg/regevdata/projects/FASI_DOmice/scRNA_seq/180426_SL_NVK_0016_BHCWMJDMXX/cellranger/mkfastq/HCWMJDMXX/${id}/
# fastq_path=/ahg/regevdata/projects/FASI_DOmice/scRNA_seq/180525_SL-NVB_0088_BFCHCW5MDMXX/cellranger/mkfastq/HCW5MDMXX/${id}/
fastq_path=/ahg/regevdata/projects/FASI_DOmice/scRNA_seq/180525_SL-NVB_0089_AFCHCW5FDMXX/cellranger/mkfastq/HCW5FDMXX/${id}/

cellranger count --id=${newid} --sample=${sampid} --transcriptome=${transriptome_path} --chemistry=threeprime --force-cells=15000 --nosecondary --fastqs=${fastq_path} --localmem=48
# cellranger count --id=liv_004_hep --sample=liv_004_hep --transcriptome=/seq/regev_genome_portal/SOFTWARE/10X/refdata-cellranger-1.2.0/refdata-cellranger-GRCh38-1.2.0 --chemistry=threeprime --force-cells=6000 --fastqs=/ahg/regevdata/projects/MantonSkin/fastq/10x_liver004_005/HMCCTBGX3/outs/fastq_path/ --localmem=48
