#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -p core
#SBATCH -n 2
#SBATCH -M snowy
#SBATCH -t 48:00:00
#SBATCH -J bcft
#SBATCH --mail-user=josemelvin1403@gmail.com
#SBATCH --mail-type=ALL
#SBATCH -o %j.out
#SBATCH -e %j.err

module load bioinfo-tools
module load bcftools/1.20
module load samtools

IN_DIR="/proj/uppmax2025-3-3/nobackup/work/melvi/mapping/snp_analysis"
OUT_DIR="/proj/uppmax2025-3-3/nobackup/work/melvi/snp_analysis"
REF="${IN_DIR}/polished_SRR24413072_processed_assembly.fasta"

bcftools mpileup -Ou -f "$REF" "${IN_DIR}/HP126.sorted.bam" | \
bcftools call -mv --ploidy 1 -Ob -o "${OUT_DIR}/HP126.bcf"

bcftools view "${OUT_DIR}/HP126.bcf" > "${OUT_DIR}/HP126.vcf"

bcftools mpileup -Ou -f "$REF" "${IN_DIR}/DV3.sorted.bam" | \
bcftools call -mv --ploidy 1 -Ob -o "${OUT_DIR}/DV3.bcf"

bcftools view "${OUT_DIR}/DV3.bcf" > "${OUT_DIR}/DV3.vcf"
