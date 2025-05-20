#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 08:00:00
#SBATCH -M snowy
#SBATCH -J trimmomatic_dna_shortreads
#SBATCH -o /home/melvi/project/data/processed_data/DNA_short_reads/trimmomatic_dna_shortreads_%j.out
#SBATCH -e /home/melvi/project/data/processed_data/DNA_short_reads/trimmomatic_dna_shortreads_%j.err
#SBATCH --mail-user=josemelvin1403@gmail.com
#SBATCH --mail-type=END,FAIL

module load bioinfo-tools
module load trimmomatic

# Paths
IN_DIR="/proj/uppmax2025-3-3/Genome_Analysis/2_Beganovic_2023/DNA_reads/short_reads"
OUT_DIR="/proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/DNA_short_reads"
ADAPTERS="$TRIMMOMATIC_HOME/adapters/TruSeq3-PE.fa"

# Create output directory if not exists
mkdir -p $OUT_DIR

# Loop through read pairs
for R1 in ${IN_DIR}/*_1.fastq.gz
do
    SAMPLE=$(basename ${R1} _1.fastq.gz)
    R2=${IN_DIR}/${SAMPLE}_2.fastq.gz

    echo "Processing $SAMPLE..."

    trimmomatic PE -threads 8 -phred33 \
      $R1 $R2 \
      ${OUT_DIR}/${SAMPLE}_1_paired.fastq.gz ${OUT_DIR}/${SAMPLE}_1_unpaired.fastq.gz \
      ${OUT_DIR}/${SAMPLE}_2_paired.fastq.gz ${OUT_DIR}/${SAMPLE}_2_unpaired.fastq.gz \
      ILLUMINACLIP:${ADAPTERS}:2:30:10 \
      SLIDINGWINDOW:4:20 MINLEN:150
done
