#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -p core
#SBATCH -n 2
#SBATCH -M snowy
#SBATCH -t 48:00:00
#SBATCH -J star_genome_index
#SBATCH --mail-user=josemelvin1403@gmail.com
#SBATCH --mail-type=ALL
#SBATCH -o %j.out
#SBATCH -e %j.err

module load bioinfo-tools
module load star

STAR --runMode genomeGenerate \
  --genomeDir /proj/uppmax2025-3-3/nobackup/work/melvi/de_analysis/star/genome_index \
  --genomeFastaFiles /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/polished_processed/SRR24413072/polished_SRR24413072_processed_assembly.fasta \
  --sjdbGTFfile /proj/uppmax2025-3-3/nobackup/work/melvi/annotation/refined_prokka/SRR24413072/SRR24413072_refined.gff \
  --sjdbGTFtagExonParentTranscript Parent \
  --runThreadN 2 \
  --genomeSAindexNbases 10 \
  --sjdbGTFfeatureExon CDS 
