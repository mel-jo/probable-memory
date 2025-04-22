#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 24:00:00
#SBATCH -M snowy
#SBATCH -J flye_SRR24413072
#SBATCH -o /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/raw/SRR24413072/flye_SRR24413072.out
#SBATCH -e /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/raw/SRR24413072/flye_SRR24413072.err
#SBATCH --mail-user=josemelvin1403@gmail.com
#SBATCH --mail-type=END,FAIL

module load bioinfo-tools
module load Flye

flye --nano-raw /proj/uppmax2025-3-3/Genome_Analysis/2_Beganovic_2023/DNA_reads/SRR24413072.fastq.gz \
     --out-dir /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/raw/SRR24413072 \
     --genome-size 9.6m \
     --threads 8

