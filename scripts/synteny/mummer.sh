#!/bin/bash -l
#SBATCH -A uppmax2025-2-288
#SBATCH -p core
#SBATCH -n 2
#SBATCH -M snowy
#SBATCH -t 48:00:00
#SBATCH -J mummerplot
#SBATCH --mail-user=josemelvin1403@gmail.com
#SBATCH --mail-type=ALL
#SBATCH -o %j.out
#SBATCH -e %j.err

# Load modules
module load bioinfo-tools
module load MUMmer
module load Amber/20
module load ghostscript     

# Set input files
R7="/proj/uppmax2025-3-3/nobackup/work/melvi/assembly/flye_assembly/SRR24413072/polished_SRR24413072_processed_assembly.fasta"
HP126="/proj/uppmax2025-3-3/nobackup/work/melvi/assembly/canu_assembly/polished/SRR24413066/polished_SRR24413066_canu_assembly.fasta"
DV3="/proj/uppmax2025-3-3/nobackup/work/melvi/assembly/canu_assembly/polished/SRR24413081/polished_SRR24413081_canu_assembly.fasta"

# Output directory
OUTDIR="/proj/uppmax2025-3-3/nobackup/work/melvi/synteny/mummer_second"
mkdir -p $OUTDIR

# Reusable function
run_mummerplot () {
    REF=$1
    QRY=$2
    PREFIX=$3

    echo "Running MUMmer for: $PREFIX"

    nucmer --prefix=$OUTDIR/$PREFIX $REF $QRY
    delta-filter -1 $OUTDIR/${PREFIX}.delta > $OUTDIR/${PREFIX}.filter
    mummerplot --fat --filter --postscript -p $OUTDIR/${PREFIX}_plot $OUTDIR/${PREFIX}.filter

    ps2pdf $OUTDIR/${PREFIX}_plot.ps $OUTDIR/${PREFIX}_plot.pdf

    echo "Finished: $PREFIX"
}

# Run all comparisons

run_mummerplot $HP126 $R7 "R7_vs_HP126"
run_mummerplot $DV3 $R7 "R7_vs_DV3"
run_mummerplot $DV3 $HP126 "HP126_vs_DV3"
