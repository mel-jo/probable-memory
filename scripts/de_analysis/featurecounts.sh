#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 48:00:00
#SBATCH -M snowy
#SBATCH -J bwa_feature_counts
#SBATCH -o %j.out
#SBATCH -e %j.err
#SBATCH --mail-user=josemelvin1403@gmail.com
#SBATCH --mail-type=END,FAIL

module load bioinfo-tools
module load subread

featureCounts -T 2 -p \
  -a /proj/uppmax2025-3-3/nobackup/work/melvi/annotation/refined_prokka/SRR24413072/SRR24413072_refined.gff \
  -o /proj/uppmax2025-3-3/nobackup/work/melvi/de_analysis/counts/featurecounts_matrix.txt \
  -t CDS -g ID \
  /proj/uppmax2025-3-3/nobackup/work/melvi/de_analysis/bwa/*.bam
