#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -p core
#SBATCH -n 2
#SBATCH -M snowy
#SBATCH -t 48:00:00
#SBATCH -J star_mapping
#SBATCH --mail-user=josemelvin1403@gmail.com
#SBATCH --mail-type=ALL
#SBATCH -o %j.out
#SBATCH -e %j.err

module load bioinfo-tools
module load star

READ_DIR=/proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/RNA_short_reads
OUT_DIR=/proj/uppmax2025-3-3/nobackup/work/melvi/de_analysis/star/mapped_reads
STAR_INDEX=/proj/uppmax2025-3-3/nobackup/work/melvi/de_analysis/star/genome_index

for SAMPLE in SRR24516456 SRR24516457 SRR24516458 SRR24516459 SRR24516460 SRR24516461 SRR24516462 SRR24516463 SRR24516464
do
    STAR --genomeDir "$STAR_INDEX" \
         --readFilesIn "$READ_DIR/${SAMPLE}_1_paired.fastq.gz" "$READ_DIR/${SAMPLE}_2_paired.fastq.gz" \
         --readFilesCommand zcat \
         --outFileNamePrefix "$OUT_DIR/${SAMPLE}_" \
         --outSAMtype BAM SortedByCoordinate \
         --limitBAMsortRAM 10000000000 \
         --runThreadN 2
done
