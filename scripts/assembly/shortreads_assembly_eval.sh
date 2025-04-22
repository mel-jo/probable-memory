#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 08:00:00
#SBATCH -M snowy
#SBATCH -J polished_processed_raw_assembly_Eval
#SBATCH -o /home/melvi/project/analyses_results/assembly_reports/%j.out
#SBATCH -e /home/melvi/project/analyses_results/assembly_reports/%j.err
#SBATCH --mail-user=josemelvin1403@gmail.com
#SBATCH --mail-type=END,FAIL

module load bioinfo-tools
module load quast

quast.py \
  /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/shortDNA_assemblies/final/SRR24413066/shortreads_assembly_SRR24413066.fasta \
  -R /proj/uppmax2025-3-3/Genome_Analysis/2_Beganovic_2023/reference_genome/HP126_genome.fasta \
  -o /home/melvi/project/analyses_results/assembly_reports/shortreads_assembly/SRR24413066 \
  --threads 8

quast.py \
  /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/shortDNA_assemblies/final/SRR24413072/shortreads_assembly_SRR24413072.fasta \
  -R /proj/uppmax2025-3-3/Genome_Analysis/2_Beganovic_2023/reference_genome/R7_genome.fasta \
  -o /home/melvi/project/analyses_results/assembly_reports/shortreads_assembly/SRR24413072 \
  --threads 8

quast.py \
  /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/shortDNA_assemblies/final/SRR24413081/shortreads_assembly_SRR24413081.fasta \
  -R /proj/uppmax2025-3-3/Genome_Analysis/2_Beganovic_2023/reference_genome/DV3_genome.fasta \
  -o /home/melvi/project/analyses_results/assembly_reports/shortreads_assembly/SRR24413081 \
  --threads 8
