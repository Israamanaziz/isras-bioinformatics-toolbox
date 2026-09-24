#!/bin/bash

set -e

# Build subread reference genome index

# directory containing ref and index files
INDEX_DIR="/home/israa/isras-bioinformatics-toolbox/bash/index"

# create directory

mkdir -p "$INDEX_DIR"

cd "$INDEX_DIR"

# build the subread index

subread-buildindex \
-o genome_index \  # prefix can change according to organism - humsn, mouse, yeast, etc (its for user interpretation)
genome.fa

echo "Index built successfully"