#!/bin/bash

# Rename SRA runs with simple sample names

cd ../data/raw/

for x in \
"SRR8724694 Unstim1" \
"SRR8724695 Unstim2" \
"SRR8724696 Unstim3" \
"SRR8724697 Stim1" \
"SRR8724698 Stim2" \
"SRR8724699 Stim3"
do
    set -- $x

    # I1 = index, R1 = barcode/UMI, R2 = transcript
    mv "${1}_1.fastq.gz" "${2}_I1.fastq.gz"
    mv "${1}_2.fastq.gz" "${2}_R1.fastq.gz"
    mv "${1}_3.fastq.gz" "${2}_R2.fastq.gz"
done
