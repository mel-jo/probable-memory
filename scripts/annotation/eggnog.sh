#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -p core
#SBATCH -n 2
#SBATCH -M snowy
#SBATCH -t 72:00:00
#SBATCH -J eggnog
#SBATCH --mail-user=josemelvin1403@gmail.com
#SBATCH --mail-type=ALL
#SBATCH -o %j.out
#SBATCH -e %j.err
#SBATCH --mem=16G

module load bioinfo-tools
module load eggNOG-mapper

emapper.py -i /proj/uppmax2025-3-3/nobackup/work/melvi/annotation/prokka/SRR24413066/SRR24413066_plain.faa \
           -o SRR24413066_emapper \
           --itype proteins \
           --cpu 2 \
           --usemem \
           --output_dir /proj/uppmax2025-3-3/nobackup/work/melvi/annotation/eggnog/SRR24413066

emapper.py -i /proj/uppmax2025-3-3/nobackup/work/melvi/annotation/prokka/SRR24413072/SRR24413072_plain.faa \
           -o SRR24413072_emapper \
           --itype proteins \
           --cpu 2 \
           --usemem \
           --output_dir /proj/uppmax2025-3-3/nobackup/work/melvi/annotation/eggnog/SRR24413072

emapper.py -i /proj/uppmax2025-3-3/nobackup/work/melvi/annotation/prokka/SRR24413081/SRR24413081_plain.faa \
           -o SRR24413081_emapper \
           --itype proteins \
           --cpu 2 \
           --usemem \
           --output_dir /proj/uppmax2025-3-3/nobackup/work/melvi/annotation/eggnog/SRR24413081
