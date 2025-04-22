#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -p core
#SBATCH -n 2
#SBATCH -M snowy
#SBATCH -t 48:00:00
#SBATCH -J prokka_with_without_reference
#SBATCH --mail-user=josemelvin1403@gmail.com
#SBATCH --mail-type=ALL
#SBATCH -o %j.out
#SBATCH -e %j.err

module load bioinfo-tools
module load prokka

# Run Prokka without reference
prokka --outdir /proj/uppmax2025-3-3/nobackup/work/melvi/annotation/prokka/SRR24413066 \
       --prefix SRR24413066_plain \
       --cpus 2 \
       --force \
       /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/canu_assembly/polished/SRR24413066/polished_SRR24413066_canu_assembly.fasta

# Run Prokka with reference
prokka --outdir /proj/uppmax2025-3-3/nobackup/work/melvi/annotation/refined_prokka/SRR24413066 \
       --prefix SRR24413066_refined \
       --cpus 2 \
       --proteins /proj/uppmax2025-3-3/nobackup/work/melvi/annotation/annotation_references/HP126_reference_annotation_GCF_024218735.1.gbff \
       --force \
       /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/canu_assembly/polished/SRR24413066/polished_SRR24413066_canu_assembly.fasta

# Run Prokka without reference
prokka --outdir /proj/uppmax2025-3-3/nobackup/work/melvi/annotation/prokka/SRR24413072 \
       --prefix SRR24413072_plain \
       --cpus 2 \
       --force \
       /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/polished_processed/SRR24413072/polished_SRR24413072_processed_assembly.fasta

# Run Prokka with reference
prokka --outdir /proj/uppmax2025-3-3/nobackup/work/melvi/annotation/refined_prokka/SRR24413072 \
       --prefix SRR24413072_refined \
       --cpus 2 \
       --proteins /proj/uppmax2025-3-3/nobackup/work/melvi/annotation/annotation_references/R7_reference_annotation_GCF_022760195.1.gbff \
       --force \
       /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/polished_processed/SRR24413072/polished_SRR24413072_processed_assembly.fasta

# Run Prokka without reference
prokka --outdir /proj/uppmax2025-3-3/nobackup/work/melvi/annotation/prokka/SRR24413081 \
       --prefix SRR24413081_plain \
       --cpus 2 \
       --force \
       /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/canu_assembly/polished/SRR24413081/polished_SRR24413081_canu_assembly.fasta

# Run Prokka with reference
prokka --outdir /proj/uppmax2025-3-3/nobackup/work/melvi/annotation/refined_prokka/SRR24413081 \
       --prefix SRR24413081_refined \
       --cpus 2 \
       --proteins /proj/uppmax2025-3-3/nobackup/work/melvi/annotation/annotation_references/DV3_reference_annotation_GCF_024223055.1.gbff \
       --force \
       /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/canu_assembly/polished/SRR24413081/polished_SRR24413081_canu_assembly.fasta
