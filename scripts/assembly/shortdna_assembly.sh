#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 48:00:00
#SBATCH -J spades_short_reads
#SBATCH --mail-user=josemelvin1403@gmail.com
#SBATCH --mail-type=END,FAIL
#SBATCH -o /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/shortDNA_assemblies/spades_short_reads_%j.out
#SBATCH -e /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/shortDNA_assemblies/spades_short_reads_%j.err

# Load modules
module load conda
ENV=spades_env

conda run -n $ENV spades.py \
-1 /proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/DNA_short_reads/SRR24413065_1_paired.fastq.gz \
-2 /proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/DNA_short_reads/SRR24413065_2_paired.fastq.gz \
-o /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/shortDNA_assemblies/final/SRR24413066 \
--threads 8

conda run -n $ENV spades.py \
-1 /proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/DNA_short_reads/SRR24413071_1_paired.fastq.gz \
-2 /proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/DNA_short_reads/SRR24413071_2_paired.fastq.gz \
-o /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/shortDNA_assemblies/final/SRR24413072 \
--threads 8

conda run -n $ENV spades.py \
-1 /proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/DNA_short_reads/SRR24413080_1_paired.fastq.gz \
-2 /proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/DNA_short_reads/SRR24413080_2_paired.fastq.gz \
-o /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/shortDNA_assemblies/final/SRR24413081 \
--threads 8
