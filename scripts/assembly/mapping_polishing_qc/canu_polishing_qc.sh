#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 72:00:00
#SBATCH -M snowy
#SBATCH -J canu_assembly_polishing_evaluation
#SBATCH -o %j.out
#SBATCH -e %j.err
#SBATCH --mail-user=josemelvin1403@gmail.com
#SBATCH --mail-type=END,FAIL

module load bioinfo-tools
module load Pilon
module load quast

cd /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/canu_assembly/polished/SRR24413066

java -Xmx16G -jar $PILON_HOME/pilon.jar \
  --genome /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/canu_assembly/bwa/SRR24413066/canu_SRR24413066.contigs.fasta \
  --frags /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/canu_assembly/bwa/SRR24413066/aligned_reads_SRR24413066_sorted.bam \
  --output polished_SRR24413066_canu_assembly \
  --threads 2

cd /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/canu_assembly/polished/SRR24413072

java -Xmx16G -jar $PILON_HOME/pilon.jar \
  --genome /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/canu_assembly/bwa/SRR24413072/canu_SRR24413072.contigs.fasta \
  --frags /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/canu_assembly/bwa/SRR24413072/aligned_reads_SRR24413072_sorted.bam \
  --output polished_SRR24413072_canu_assembly \
  --threads 2

cd /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/canu_assembly/polished/SRR24413081

java -Xmx16G -jar $PILON_HOME/pilon.jar \
  --genome /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/canu_assembly/bwa/SRR24413081/canu_SRR24413081.contigs.fasta \
  --frags /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/canu_assembly/bwa/SRR24413081/aligned_reads_SRR24413081_sorted.bam \
  --output polished_SRR24413081_canu_assembly \
  --threads 2

cd 

quast.py \
  /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/canu_assembly/polished/SRR24413066/polished_SRR24413066_canu_assembly.fasta \
  -R /proj/uppmax2025-3-3/Genome_Analysis/2_Beganovic_2023/reference_genome/HP126_genome.fasta \
  -o /home/melvi/project/analyses_results/assembly_reports/canu_assemblies/SRR24413066 \
  --threads 2

quast.py \
  /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/canu_assembly/polished/SRR24413072/polished_SRR24413072_canu_assembly.fasta \
  -R /proj/uppmax2025-3-3/Genome_Analysis/2_Beganovic_2023/reference_genome/R7_genome.fasta \
  -o /home/melvi/project/analyses_results/assembly_reports/canu_assemblies/SRR24413072 \
  --threads 2

quast.py \
  /proj/uppmax2025-3-3/nobackup/work/melvi/assembly/canu_assembly/polished/SRR24413081/polished_SRR24413081_canu_assembly.fasta \
  -R /proj/uppmax2025-3-3/Genome_Analysis/2_Beganovic_2023/reference_genome/DV3_genome.fasta \
  -o /home/melvi/project/analyses_results/assembly_reports/canu_assemblies/SRR24413081 \ 
  --threads 2
