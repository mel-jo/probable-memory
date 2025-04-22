#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 2-00:00:00
#SBATCH -M snowy
#SBATCH -J rna_shortreads_afterqc
#SBATCH -o %j.out
#SBATCH -e %j.err
#SBATCH --mail-user=josemelvin1403@gmail.com
#SBATCH --mail-type=END,FAIL

#loading the necessary modules
module load bioinfo-tools
module load FastQC
module load MultiQC

#qc for processed DNA short reads
fastqc /proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/RNA_short_reads/*.fastq.gz \
-o /home/melvi/project/analyses_results/preprocess/rna_shortreads/after_qc --threads 8

#aggregating with multiqc
multiqc /home/melvi/project/analyses_results/preprocess/rna_shortreads/after_qc \
-o /home/melvi/project/analyses_results/preprocess/rna_shortreads/after_qc/multiqc_report
