#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -p core
#SBATCH -n 2
#SBATCH -M snowy
#SBATCH -t 48:00:00
#SBATCH -J bwa_rna_mapping
#SBATCH --mail-user=josemelvin1403@gmail.com
#SBATCH --mail-type=ALL
#SBATCH -o %j.out
#SBATCH -e %j.err

# Set paths
REF="/proj/uppmax2025-3-3/nobackup/work/melvi/de_analysis/bwa/polished_SRR24413072_processed_assembly.fasta"
READ_DIR="/proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/RNA_short_reads"
OUT_DIR="/proj/uppmax2025-3-3/nobackup/work/melvi/de_analysis/bwa"

# Create output directory if it doesn't exist
mkdir -p "$OUT_DIR"

# Load necessary modules
module load bioinfo-tools
module load bwa
module load samtools

# List of sample SRR IDs
SAMPLES=(
  SRR24516456 SRR24516457 SRR24516458
  SRR24516459 SRR24516460 SRR24516461
  SRR24516462 SRR24516463 SRR24516464
)

# Loop through each sample
for SAMPLE in "${SAMPLES[@]}"
do
  echo "Processing $SAMPLE..."

  bwa mem -t 2 "$REF" \
    "$READ_DIR/${SAMPLE}_1_paired.fastq.gz" "$READ_DIR/${SAMPLE}_2_paired.fastq.gz" | \
    samtools sort -@ 2 -o "$OUT_DIR/${SAMPLE}_bwa.sorted.bam"

  samtools index "$OUT_DIR/${SAMPLE}_bwa.sorted.bam"
done

