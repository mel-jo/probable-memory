#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 16:00:00
#SBATCH -M snowy
#SBATCH -J canu_correction
#SBATCH -o /home/melvi/project/data/processed_data/DNA_long_reads/canu_correction_%j.out
#SBATCH -e /home/melvi/project/data/processed_data/DNA_long_reads/canu_correction_%j.err
#SBATCH --mail-user=josemelvin1403@gmail.com
#SBATCH --mail-type=END,FAIL


# Load modules
module load bioinfo-tools
module load canu/2.2

# Set paths
INPUT_DIR=/home/melvi/project/data/raw_data/long_reads
OUTPUT_DIR=/home/melvi/project/data/processed_data/DNA_long_reads
GENOME_SIZE=9.6m

# List of sample names
samples=(SRR24413066 SRR24413072 SRR24413081)

for sample in "${samples[@]}"
do
    echo "Running Canu correction for $sample"
    canu \
      -correct \
      -p "$sample" \
      -d "$OUTPUT_DIR/$sample" \
      genomeSize=$GENOME_SIZE \
      -nanopore-raw "$INPUT_DIR/$sample.fastq.gz" 
done

