#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 16:00:00
#SBATCH -M snowy
#SBATCH -J canu_correction
#SBATCH -o /home/melvi/project/data/processed_data/DNA_long_reads/resume_SRR24413066_canu_correction_%j.out
#SBATCH -e /home/melvi/project/data/processed_data/DNA_long_reads/resume_SRR24413066_canu_correction_%j.err
#SBATCH --mail-user=josemelvin1403@gmail.com
#SBATCH --mail-type=END,FAIL


# Load modules
module load bioinfo-tools
module load canu/2.2

INPUT=/home/melvi/project/data/raw_data/long_reads/SRR24413066.fastq.gz
OUTDIR=/home/melvi/project/data/processed_data/DNA_long_reads/SRR24413066

canu \
  -correct \
  -p SRR24413066 \
  -d "$OUTDIR" \
  genomeSize=9.6m \
  -nanopore-raw "$INPUT"
