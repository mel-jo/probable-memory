#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 08:00:00
#SBATCH -M snowy
#SBATCH -J quast_canu_assemblies
#SBATCH -o %j.out
#SBATCH -e %j.err
#SBATCH --mail-user=josemelvin1403@gmail.com
#SBATCH --mail-type=END,FAIL

module load bioinfo-tools
module load quast

quast.py \
  /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/canu_assembly/polished/SRR24413081/polished_SRR24413081_canu_assembly.fasta \
  -R /proj/uppmax2025-3-3/Genome_Analysis/2_Beganovic_2023/reference_genome/DV3_genome.fasta \
  -o /home/melvi/project/analyses_results/assembly_reports/canu_assemblies/SRR24413081 \
  --threads 2
