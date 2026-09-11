# Reproducible Single-Cell RNA-seq Analysis

## Overview

This project presents a reproducible single-cell RNA-seq analysis using a publicly available human NKT-cell dataset.

The dataset contains unstimulated and PMA/ionomycin-stimulated NKT cells, with three biological replicates for each condition.

The goal is to explore how stimulation changes gene expression and cellular states at single-cell resolution.

## Dataset

* **GEO:** GSE128243
* **SRA:** SRP188375
* **Organism:** Homo sapiens
* **Cell type:** Natural killer T (NKT) cells
* **Platform:** 10x Genomics Chromium 3′
* **Chemistry:** v2
* **Samples:** 6

### Experimental Design

| Condition    | Samples                   |
| ------------ | ------------------------- |
| Unstimulated | Unstim1, Unstim2, Unstim3 |
| Stimulated   | Stim1, Stim2, Stim3       |

## Workflow

```text id="rm7pua"
Public sequencing data
        ↓
FASTQ generation
        ↓
FastQC / MultiQC
        ↓
Cell Ranger
        ↓
Cell-level QC
        ↓
Normalization
        ↓
PCA
        ↓
Clustering and UMAP
        ↓
Differential expression
        ↓
Pathway analysis
        ↓
Biological interpretation
```

## Tools

* SRA Toolkit
* FastQC
* MultiQC
* Cell Ranger
* R / Seurat
* scDblFinder
* ggplot2
* clusterProfiler
* Quarto
* Git / GitHub

## Repository Structure

```text id="4pyl0x"
data/       Metadata and data organization
scripts/    Analysis scripts
results/    QC results and figures
docs/       Project documentation
report/     Final analysis report
```

Large sequencing files are not stored in this repository. The scripts and sample metadata needed to reproduce the analysis are provided.

## Analysis Goal

The final analysis will compare stimulated and unstimulated NKT cells to identify changes in transcriptional states, differentially expressed genes, and biological pathways associated with stimulation.

