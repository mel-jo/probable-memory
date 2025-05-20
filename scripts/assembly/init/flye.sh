#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -p core
#SBATCH -n 4
#SBATCH -M snowy
#SBATCH -t 48:00:00
#SBATCH -J flye
#SBATCH --mail-user=josemelvin1403@gmail.com
#SBATCH --mail-type=ALL
#SBATCH -o canu_corrected_%j.out
#SBATCH -e canu_corrected_%j.err

module load bioinfo-tools
module load Flye

flye --nano-corr /proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/DNA_long_reads/SRR24413066/SRR24413066.correctedReads.fasta.gz \
     --out-dir /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/processed/SRR24413066 \
     --genome-size 9.6m \
     --threads 4

flye --nano-corr /proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/DNA_long_reads/SRR24413066/SRR24413072.correctedReads.fasta.gz \
     --out-dir /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/processed/SRR24413072 \
     --genome-size 9.6m \
     --threads 4

flye --nano-corr /proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/DNA_long_reads/SRR24413066/SRR24413081.correctedReads.fasta.gz \
     --out-dir /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/processed/SRR24413081 \
     --genome-size 9.6m \
     --threads 4
