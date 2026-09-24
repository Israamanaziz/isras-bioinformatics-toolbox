#!/bin/bash

set -euo

#fastp for single-end fastq files

# define the  directories according to your filepath

FASTQ_DIR="/home/israa/isras-bioinformatics-toolbox/bash/raw"
TRIMMED_DIR="/home/israa/isras-bioinformatics-toolbox/bash/trimmed_fastq"
QC_DIR="/home/israa/isras-bioinformatics-toolbox/bash/qc/trimmed_qc"

# Create output directories

mkdir -p "$TRIMMED_DIR"
mkdir -p "$QC_DIR"

# Run fastp on all single-end fastq files

for FILE in "$FASTQ_DIR"/*fastq.gz
do

SAMPLE=$(basename "$FILE" .fastq.gz)

echo "Trimming $SAMPLE"

fastp \
-i "$FILE" \
-o "$TRIMMED_DIR/${SAMPLE}.fastq.gz" \
--html "$QC_DIR/${SAMPLE}_fastp.html" \
--json "$QC_DIR/${SAMPLE}_fastp.json"

echo "completed trimming: $SAMPLE"

done

echo "single-end trimmming completed"