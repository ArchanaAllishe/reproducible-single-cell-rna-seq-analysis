#!/bin/bash

# Stop the script if a command fails, an undefined variable is used,
# or a command in a pipeline fails.
set -euo pipefail


# All downloaded sequencing data will be stored inside this project.
project_dir="/media/daniel/Scratch2/Gus_Mayo/Archana/reproducible_single_cell_rna_seq_analysis"

# Directory for the final FASTQ files.
raw_data_dir="$project_dir/data/raw"

# Directory used to store the SRA files downloaded by prefetch.
sra_cache_dir="$project_dir/data/sra_cache"


# Create the data directories if they do not already exist.
mkdir -p "$raw_data_dir" "$sra_cache_dir"


# Match each experimental sample name with its SRA run accession.
# These accessions identify the sequencing runs in the NCBI SRA database.
declare -A samples=(
    [Unstim1]="SRR8724694"
    [Unstim2]="SRR8724695"
    [Unstim3]="SRR8724696"
    [Stim1]="SRR8724697"
    [Stim2]="SRR8724698"
    [Stim3]="SRR8724699"
)


# Process one sample at a time.
for sample_name in Unstim1 Unstim2 Unstim3 Stim1 Stim2 Stim3; do

    # Get the SRA accession associated with the current sample.
    sra_run="${samples[$sample_name]}"

    echo
    echo "Processing $sample_name ($sra_run)"


    # Download the sequencing run from NCBI SRA.
    # --max-size u allows prefetch to download the complete run
    # without applying a maximum file-size limit.
    prefetch "$sra_run"\
        --output-directory "$sra_cache_dir"\
        --max-size u

    echo "Download complete for $sample_name"


    # Convert the downloaded SRA data into FASTQ files.
    # --split-files creates separate files for paired-end reads.
    # --progress displays the conversion progress in the terminal.
    fasterq-dump \
    "$sra_cache_dir/$sra_run" \
    --split-files \
    --include-technical \
    --outdir "$raw_data_dir" \
    --threads 6 \
    --progress


    echo "FASTQ conversion complete for $sample_name"


    # Compress the FASTQ files to reduce disk-space usage.
    # Paired reads are stored as _1.fastq and _2.fastq.
    gzip "$raw_data_dir/${sra_run}_1.fastq"
    gzip "$raw_data_dir/${sra_run}_2.fastq"

    echo "Compression complete for $sample_name"

done


echo
echo "All samples have been downloaded and converted to compressed FASTQ files."
