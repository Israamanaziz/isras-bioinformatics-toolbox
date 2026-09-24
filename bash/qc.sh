#!/bin/bash

set -euo

# define directories (You just need to insert your path to directory)

FASTQ_DIR="/home/israa/isras-bioinformatics-toolbox/bash/raw"
QC_DIR="/home/israa/isras-bioinformatics-toolbox/bash/qc"

# Create output directories

mkdir -p "$QC_DIR"

# run fastqc tool

echo "running fastqc"

fastqc "$FASTQ_DIR"/*.fastq.gz \
--outdir "$QC_DIR"

# run multiqc 

multiqc "$QC_DIR" \
--outdir "$QC_DIR"

echo "ALL qc completed"

