#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 06:00:00
#SBATCH -M snowy
#SBATCH -J fastqc_dna_shortreads_afterqc
#SBATCH -o /home/melvi/project/analyses_results/preprocess/dna_shortreads/after_qc/fastqc_dna_shortreads_%j.out
#SBATCH -e /home/melvi/project/analyses_results/preprocess/dna_shortreads/after_qc/fastqc_dna_shortreads_%j.err
#SBATCH --mail-user=josemelvin1403@gmail.com
#SBATCH --mail-type=END,FAIL

module load bioinfo-tools
module load FastQC

INPUT_DIR="/proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/DNA_short_reads"
OUTPUT_DIR="/home/melvi/project/analyses_results/preprocess/dna_shortreads/after_qc"
mkdir -p "$OUTPUT_DIR"

echo "Running FastQC on all short-read FASTQ files..."

fastqc "$INPUT_DIR"/*_paired.fastq.gz -o "$OUTPUT_DIR" --threads 4

echo "FastQC complete."


