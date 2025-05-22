#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 06:00:00
#SBATCH -M snowy
#SBATCH -J fastqc_dna_shortreads_initqc
#SBATCH -o /home/melvi/project/analyses_results/preprocess/dna_shortreads/init_qc/fastqc_dna_shortreads_%j.out
#SBATCH -e /home/melvi/project/analyses_results/preprocess/dna_shortreads/init_qc/fastqc_dna_shortreads_%j.err
#SBATCH --mail-user=josemelvin1403@gmail.com
#SBATCH --mail-type=END,FAIL

module load bioinfo-tools
module load FastQC

INPUT_DIR="/home/melvi/project/data/raw_data/DNA_short_reads"
OUTPUT_DIR="/home/melvi/project/analyses_results/preprocess/dna_shortreads/init_qc"
mkdir -p "$OUTPUT_DIR"

# Loop over all *_1.fastq.gz files and run FastQC on both pairs
for file1 in "$INPUT_DIR"/*_1.fastq.gz; do
    sample=$(basename "$file1" _1.fastq.gz)
    file2="$INPUT_DIR/${sample}_2.fastq.gz"

    fastqc "$file1" "$file2" -o "$OUTPUT_DIR" --threads 4
done

#aggregating with multiqc
multiqc /home/melvi/project/analyses_results/preprocess/dna_shortreads/init_qc \
-o /home/melvi/project/analyses_results/preprocess/dna_shortreads/init_qc/multiqc_report
