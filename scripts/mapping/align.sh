#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 08:00:00
#SBATCH -M snowy
#SBATCH -J mapping_processed_raw_longr_with_shortr
#SBATCH -o /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/processed/bwa_processed_assemblies/%j.out
#SBATCH -e /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/processed/bwa_processed_assemblies/%j.err
#SBATCH --mail-user=josemelvin1403@gmail.com
#SBATCH --mail-type=END,FAIL

module load bioinfo-tools
module load bwa
module load samtools

bwa mem \
/proj/uppmax2025-3-3/nobackup/work/melvi/assembly/processed/bwa_processed_assemblies/SRR24413066/SRR24413066_processed_assembly.fasta \
/proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/DNA_short_reads/SRR24413065_1_paired.fastq.gz \
/proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/DNA_short_reads/SRR24413065_2_paired.fastq.gz \
> /proj/uppmax2025-3-3/nobackup/work/melvi/mapping/processed/SRR24413066/aligned_reads_SRR24413066.sam

bwa mem \
/proj/uppmax2025-3-3/nobackup/work/melvi/assembly/processed/bwa_processed_assemblies/SRR24413072/SRR24413072_processed_assembly.fasta \
/proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/DNA_short_reads/SRR24413071_1_paired.fastq.gz \
/proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/DNA_short_reads/SRR24413071_2_paired.fastq.gz \
> /proj/uppmax2025-3-3/nobackup/work/melvi/mapping/processed/SRR24413072/aligned_reads_SRR24413072.sam

bwa mem \
/proj/uppmax2025-3-3/nobackup/work/melvi/assembly/processed/bwa_processed_assemblies/SRR24413081/SRR24413081_processed_assembly.fasta \
/proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/DNA_short_reads/SRR24413080_1_paired.fastq.gz \
/proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/DNA_short_reads/SRR24413080_2_paired.fastq.gz \
> /proj/uppmax2025-3-3/nobackup/work/melvi/mapping/processed/SRR24413081/aligned_reads_SRR24413081.sam

bwa mem \
/proj/uppmax2025-3-3/nobackup/work/melvi/assembly/raw/bwa_raw_assemblies/SRR24413066/SRR24413066_raw_assembly.fasta \
/proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/DNA_short_reads/SRR24413065_1_paired.fastq.gz \
/proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/DNA_short_reads/SRR24413065_2_paired.fastq.gz \
> /proj/uppmax2025-3-3/nobackup/work/melvi/mapping/raw/SRR24413066/aligned_reads_SRR24413066.sam

bwa mem \
/proj/uppmax2025-3-3/nobackup/work/melvi/assembly/raw/bwa_raw_assemblies/SRR24413072/SRR24413072_raw_assembly.fasta \
/proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/DNA_short_reads/SRR24413071_1_paired.fastq.gz \
/proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/DNA_short_reads/SRR24413071_2_paired.fastq.gz \
> /proj/uppmax2025-3-3/nobackup/work/melvi/mapping/raw/SRR24413072/aligned_reads_SRR24413072.sam

bwa mem \
/proj/uppmax2025-3-3/nobackup/work/melvi/assembly/raw/bwa_raw_assemblies/SRR24413081/SRR24413081_raw_assembly.fasta \
/proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/DNA_short_reads/SRR24413080_1_paired.fastq.gz \
/proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/DNA_short_reads/SRR24413080_2_paired.fastq.gz \
> /proj/uppmax2025-3-3/nobackup/work/melvi/mapping/raw/SRR24413081/aligned_reads_SRR24413081.sam
