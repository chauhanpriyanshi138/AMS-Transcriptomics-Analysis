# AMS-Transcriptomics-Analysis

# Transcriptomic Analysis of Acute Mountain Sickness (AMS)

## Overview
This project performs transcriptomic data analysis to investigate gene expression changes associated with hypoxic conditions in Acute Mountain Sickness (AMS).

## Background
Acute Mountain Sickness (AMS) occurs due to reduced oxygen availability at high altitudes. Molecular responses to hypoxia involve complex gene regulation, including pathways such as nitric oxide signaling and inflammation.

## Objectives
- Identify differentially expressed genes under hypoxic conditions
- Explore gene expression patterns associated with stress response
- Visualize transcriptomic variation using computational tools

## Dataset
- Source: NCBI GEO (GSE52209)
- Type: Microarray gene expression data
- Samples: Control vs high-altitude conditions

## Methods
- Data preprocessing and cleaning in R
- Conversion of expression values to numeric format
- Group-wise comparison (control vs treated samples)
- Log fold change (logFC) calculation
- Gene classification based on expression trends
- Visualization using histogram and heatmap

## Important Note on Threshold Selection
During analysis, it was observed that the dataset exhibits relatively subtle gene expression changes.  
Using a strict threshold (e.g., logFC > 0.5) resulted in very few or no genes being detected.

To ensure meaningful exploration of gene expression trends, a relaxed threshold (logFC > 0 and < 0) was applied.  
This approach allows identification of overall upregulation and downregulation patterns rather than only large-effect genes.

This reflects a common challenge in transcriptomic data analysis, where threshold selection must be adapted based on data distribution.

## Results
- Identified approximately:
  ~19,800 upregulated genes;
  ~19,600 downregulated genes
- Generated distribution plot of log fold change
- Created heatmap of top 50 most variable genes

## Tools & Technologies
- R
- ggplot2
- pheatmap

## Key Learning
This project demonstrates:
- Handling of real-world transcriptomic datasets
- Challenges in data preprocessing and normalization
- Importance of threshold selection in gene expression analysis
- Visualization of complex biological data

## Future Improvements
- Differential expression analysis using limma/DESeq2
- Statistical significance testing (p-values, FDR)
- Pathway enrichment analysis
- Integration with microbiome-host interaction studies

## Author
Priyanshi Chauhan  
MSc Bioinformatics
