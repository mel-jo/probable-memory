#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 08:00:00
#SBATCH -M snowy
#SBATCH -J assembly_polishing
#SBATCH -o /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/%j.out
#SBATCH -e /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/%j.err
#SBATCH --mail-user=josemelvin1403@gmail.com
#SBATCH --mail-type=END,FAIL

module load bioinfo-tools
module load Pilon

cd /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/polished_raw/SRR24413066

java -Xmx16G -jar $PILON_HOME/pilon.jar \
  --genome /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/unpolished_raw/SRR24413066/SRR24413066_raw_assembly.fasta \
  --frags /proj/uppmax2025-3-3/nobackup/work/melvi/mapping/raw/SRR24413066/aligned_reads_SRR24413066_sorted.bam \
  --output polished_SRR24413066_raw_assembly \
  --threads 8

cd /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/polished_raw/SRR24413072

java -Xmx16G -jar $PILON_HOME/pilon.jar \
  --genome /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/unpolished_raw/SRR24413072/SRR24413072_raw_assembly.fasta \
  --frags /proj/uppmax2025-3-3/nobackup/work/melvi/mapping/raw/SRR24413072/aligned_reads_SRR24413072_sorted.bam \
  --output polished_SRR24413072_raw_assembly \
  --threads 8

cd /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/polished_raw/SRR24413081

java -Xmx16G -jar $PILON_HOME/pilon.jar \
  --genome /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/unpolished_raw/SRR24413081/SRR24413081_raw_assembly.fasta \
  --frags /proj/uppmax2025-3-3/nobackup/work/melvi/mapping/raw/SRR24413081/aligned_reads_SRR24413081_sorted.bam \
  --output polished_SRR24413081_raw_assembly \
  --threads 8

cd /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/polished_processed/SRR24413066

java -Xmx16G -jar $PILON_HOME/pilon.jar \
  --genome /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/unpolished_processed/SRR24413066/SRR24413066_processed_assembly.fasta \
  --frags /proj/uppmax2025-3-3/nobackup/work/melvi/mapping/processed/SRR24413066/aligned_reads_SRR24413066_sorted.bam \
  --output polished_SRR24413066_processed_assembly \
  --threads 8

cd /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/polished_processed/SRR24413072

java -Xmx16G -jar $PILON_HOME/pilon.jar \
  --genome /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/unpolished_processed/SRR24413072/SRR24413072_processed_assembly.fasta \
  --frags /proj/uppmax2025-3-3/nobackup/work/melvi/mapping/processed/SRR24413072/aligned_reads_SRR24413072_sorted.bam \
  --output polished_SRR24413072_processed_assembly \
  --threads 8

cd /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/polished_processed/SRR24413081

java -Xmx16G -jar $PILON_HOME/pilon.jar \
  --genome /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/unpolished_processed/SRR24413081/SRR24413081_processed_assembly.fasta \
  --frags /proj/uppmax2025-3-3/nobackup/work/melvi/mapping/processed/SRR24413081/aligned_reads_SRR24413081_sorted.bam \
  --output polished_SRR24413081_processed_assembly \
  --threads 8

