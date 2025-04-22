#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -p core
#SBATCH -n 4
#SBATCH -M snowy
#SBATCH -t 48:00:00
#SBATCH -J canu_assemble_81
#SBATCH --mail-user=josemelvin1403@gmail.com
#SBATCH --mail-type=ALL
#SBATCH -o canu_corrected_%j.out
#SBATCH -e canu_corrected_%j.err

# Load modules
module load bioinfo-tools
module load canu

# Move to scratch space
cd $SNIC_TMP

# Copy corrected reads and decompress them
cp /proj/uppmax2025-3-3/nobackup/work/melvi/data/processed_reads/DNA_long_reads/SRR24413081/SRR24413081.correctedReads.fasta.gz ./corrected.fasta.gz
gunzip corrected.fasta.gz  # decompress to corrected.fasta

# Run Canu in assembly-only mode
canu \
 -p canu_SRR24413081 \
 -d canu_corrected_out \
 genomeSize=9.6m \
 -nanopore-corrected corrected.fasta \
 useGrid=false \
 maxThreads=4

# Copy output back
cp -r canu_corrected_out /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/canu_assembly/SRR24413081
