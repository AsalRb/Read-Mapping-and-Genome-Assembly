# Bioinformatics Project 1 – Read Mapping & Genome Assembly

> A practical introduction to short-read sequencing analysis using *E. coli* WGS data.<br>
> *This project is part of the Introduction to Bioinformatics course.*
---

## Overview

This project demonstrates a complete workflow for analyzing Illumina short-read data:

* **Download & QC** of raw reads
* **De novo genome assembly**
* **Reference mapping & visualization**
* **Assembly quality assessment**

Dataset: [SRR8185317](https://www.ncbi.nlm.nih.gov/sra/?term=SRR8185317) (*E. coli*) /
Reference genome: [NZ_MT158477.1](https://www.ncbi.nlm.nih.gov/nuccore/NZ_MT158477.1?report=fasta)

---

## Project Structure

```
Project1/
├── input_data/                          # Raw FASTQ files, reference genome
├── qc_results/                          # FastQC outputs, quality plots
├── de_novo_assembly/                    # SPAdes assembly results
├── mapping_results/                     # BWA + SAMtools mapping outputs
├── alignment_results_assembled_genome/  # Assembly-to-reference alignments
│
├── Code_of_plots_partA.R                # R scripts for quality/read length plots
├── Bioinformatics Project 1_Asal Rabiee.pdf  # Full report & answers 
└── Commends_Rabiee.pdf                  # Step-by-step commands & pipeline
```

---

## Workflow

### Part A – QC & Preprocessing

* Download reads with **SRA Toolkit**
* Extract subsets, count motifs, generate QC plots (R)
* Run **FastQC** on subsets for quality checks

### Part B – De Novo Assembly

* Assemble reads with **SPAdes**
* Evaluate contigs using **Quast**

### Part C – Read Mapping

* Index reference genome with **BWA**
* Map reads → SAM → BAM (using **Samtools**)
* Visualize alignments in **IGV**
* Collect stats: mapping % and read depth

### Part D – Assembly Validation

* Align assembled contigs back to reference
* Check concordance & coverage

---

## Key Results

* **Reads:** 2.27M
* **Motif occurrences (TTAAATGGAA):** 176
* **Mapping rate:** 99.87%
* **Mean depth:** 48×
* **Assembly mapping rate:** 99.25%

---

## Tools Used

* [SRA Toolkit](https://github.com/ncbi/sra-tools)
* [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
* [SPAdes](https://github.com/ablab/spades)
* [Quast](https://github.com/ablab/quast)
* [BWA](http://bio-bwa.sourceforge.net/)
* [Samtools](http://www.htslib.org/)
* [IGV](https://igv.org/)
* R (`ShortRead`, `ggplot2`)

---

## Getting Started

### 1. Clone repo

```bash
git clone https://github.com/AsalRb/Read-Mapping-and-Genome-Assembly.git
cd Read-Mapping-and-Genome-Assembly
```

### 2. Install dependencies

```bash
# Ubuntu/Debian
sudo apt-get update
sudo apt-get install sra-toolkit fastqc spades bwa samtools
```

> **Note:** If installing **Quast** from source, you may also need:

```bash
pip3 install numpy matplotlib
```

### 3. Run pipeline

* Place input FASTQ files into `input_data/`
* Follow step-by-step commands in `Commends_Rabiee.pdf`
* Results appear in respective folders


