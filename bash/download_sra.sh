 #!/bin/bash

# to stop the  script if it fails
set -euo pipefail

mkdir -p raw
mkdir -p tmp

# read each srr id from accession.txt

while read -r srr
do

# skip if fastq already downloaded (so that it doesnt restart downloading from beginning, the loop
# will move to next accession)
if [[ -f "raw"/$srr.fastq.gz ]]; then
echo "$srr already downloaded"
continue

fi

echo "Downloading $srr"
#download the sra run
prefetch "$srr" -O tmp 

# convert sra into fastq files, split separates r1 and r2 for paired end
fasterq-dump "tmp/$srr" \
--split-files \
--outdir raw

# compress the fastq files to save disk space

gzip "raw/${srr}"*.fastq

echo "Completed: $srr"

# using  accession.txt as th einput for the while loop
done < accession.txt

echo "All samples downloaded successfully"
