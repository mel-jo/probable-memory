#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 2-00:00:00
#SBATCH -M snowy
#SBATCH -J rna_shortreads_initqc
#SBATCH -o %j.out
#SBATCH -e %j.err
#SBATCH --mail-user=josemelvin1403@gmail.com
#SBATCH --mail-type=END,FAIL

#loading the necessary modules
module load bioinfo-tools
module load FastQC
module load MultiQC

fastqc /proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/Trimmed_RNA_short_reads/*.fastq.gz \
-o /home/melvi/project/analyses_results/preprocess/rna_shortreads/trimmed/init_qc --threads 2

multiqc /home/melvi/project/analyses_results/preprocess/rna_shortreads/trimmed/init_qc \
-o /home/melvi/project/analyses_results/preprocess/rna_shortreads/trimmed/init_qc/multiqc_report
