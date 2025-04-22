#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 2-00:00:00
#SBATCH -M snowy
#SBATCH -J canu_correction
#SBATCH -o /home/melvi/project/data/processed_data/DNA_long_reads/SRR24413072_canu_correction_%j.out
#SBATCH -e /home/melvi/project/data/processed_data/DNA_long_reads/SRR24413072_canu_correction_%j.err
#SBATCH --mail-user=josemelvin1403@gmail.com
#SBATCH --mail-type=END,FAIL

module load bioinfo-tools
module load canu

INPUT=/home/melvi/project/data/raw_data/long_reads/SRR24413072.fastq.gz
OUTDIR=/proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/SRR24413072

canu \
  -correct \
  -p SRR24413072 \
  -d "$OUTDIR" \
  genomeSize=9.6m \
  -nanopore-raw "$INPUT"

