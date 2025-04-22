#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 48:00:00
#SBATCH -J spades_SRR24413081
#SBATCH --mail-user=josemelvin1403@gmail.com
#SBATCH --mail-type=END,FAIL
#SBATCH -o /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/shortDNA_assemblies/spades_81_%j.out
#SBATCH -e /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/shortDNA_assemblies/spades_81_%j.err

module load conda
ENV=spades_env

conda run -n $ENV spades.py \
-1 /proj/uppmax2025-3-3/Genome_Analysis/2_Beganovic_2023/DNA_reads/short_reads/SRR24413080_1.fastq.gz \
-2 /proj/uppmax2025-3-3/Genome_Analysis/2_Beganovic_2023/DNA_reads/short_reads/SRR24413080_2.fastq.gz \
-o /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/shortDNA_assemblies/SRR24413081 \
--threads 8

