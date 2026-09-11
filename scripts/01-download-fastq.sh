#!/bin/bash

set -euo pipefail


RAW_DIR="$data/raw"
SRA_DIR="$sra_cache"

mkdir -p "$RAW_DIR"
mkdir -p "$SRA_DIR"

RUNS=(
    SRR13158471
    SRR13158472
    SRR13158473
    SRR13158474
    SRR13158475
    SRR13158476
)

for RUN in "${RUNS[@]}"
do
    echo "Processing $RUN"

    # Download SRA archive
    prefetch "$RUN" \
        --output-directory "$SRA_DIR"

    # Convert SRA archive to paired FASTQ files
    fasterq-dump \
        "$SRA_DIR/$RUN/$RUN.sra" \
        --split-files \
        --outdir "$RAW_DIR" \
        --threads 6 \
        --progress

    # Compress FASTQ files
    gzip "$RAW_DIR/${RUN}_1.fastq"
    gzip "$RAW_DIR/${RUN}_2.fastq"

done

echo "FASTQ download and conversion completed."
