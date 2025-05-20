#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -M snowy
#SBATCH -J nanoplot_run
#SBATCH -o nanoplot_output_%j.log

# Load modules
module load bioinfo-tools
module load NanoPlot

NanoPlot --fastq /home/melvi/project/data/raw_data/long_reads/SRR24413066.fastq.gz -o /home/melvi/project/analyses_results/preprocess/dna_longreads/SRR24413066/after_qc 
NanoPlot --fastq /home/melvi/project/data/raw_data/long_reads/SRR24413072.fastq.gz -o /home/melvi/project/analyses_results/preprocess/dna_longreads/SRR24413072/after_qc 
NanoPlot --fastq /home/melvi/project/data/raw_data/long_reads/SRR24413081.fastq.gz -o /home/melvi/project/analyses_results/preprocess/dna_longreads/SRR24413081/after_qc 
