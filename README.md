# Reproducible Single-Cell RNA-Seq Analysis

An end-to-end single-cell RNA-sequencing analysis of publicly available
10x Genomics data, starting from raw FASTQ files and progressing through
read-level quality control, gene-expression quantification, cell-level
quality control, clustering, differential expression, and biological
interpretation.

## Project Workflow

Public FASTQ Data
→ FastQC
→ MultiQC
→ Cell Ranger
→ Cell × Gene Count Matrix
→ Seurat
→ Cell-Level QC
→ Doublet Detection
→ Normalization
→ PCA
→ Clustering
→ UMAP
→ Differential Expression
→ Pathway Analysis

## Dataset

Dataset provenance and experimental design will be documented as part of
the data-acquisition stage.

## Tools

- Linux
- SRA Toolkit
- FastQC
- MultiQC
- Cell Ranger
- R
- Seurat
- scDblFinder
- ggplot2

## Reproducibility

Raw sequencing data and large intermediate files are excluded from version
control. Dataset accessions, software versions, commands, scripts, and
analysis parameters are documented to allow the workflow to be reproduced.
