#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 08:00:00
#SBATCH -M snowy
#SBATCH -J trimmomatic_dna_shortreads
#SBATCH -o /home/melvi/project/data/processed_data/RNA_short_reads/trimmomatic_rna_shortreads_%j.out
#SBATCH -e /home/melvi/project/data/processed_data/RNA_short_reads/trimmomatic_rna_shortreads_%j.err
#SBATCH --mail-user=josemelvin1403@gmail.com
#SBATCH --mail-type=END,FAIL

module load bioinfo-tools
module load trimmomatic

INPUT_DIR="/home/melvi/project/data/raw_data/RNA_short_reads"
OUTPUT_DIR="/proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/RNA_short_reads"
mkdir -p "$OUTPUT_DIR"

ADAPTERS="$TRIMMOMATIC_HOME/adapters/TruSeq3-PE.fa"

for file1 in "$INPUT_DIR"/*_1.fastq.gz; do
    sample=$(basename "$file1" _1.fastq.gz)
    file2="$INPUT_DIR/${sample}_2.fastq.gz"

    echo "Trimming sample: $sample"

    java -jar $TRIMMOMATIC_HOME/trimmomatic-0.39.jar PE \
        -threads 4 \
        "$file1" "$file2" \
        "$OUTPUT_DIR/${sample}_1_paired.fastq.gz" "$OUTPUT_DIR/${sample}_1_unpaired.fastq.gz" \
        "$OUTPUT_DIR/${sample}_2_paired.fastq.gz" "$OUTPUT_DIR/${sample}_2_unpaired.fastq.gz" \
        ILLUMINACLIP:"$ADAPTERS":2:30:10 \
        MINLEN:35
done

echo "Trimmomatic RNA trimming complete."
