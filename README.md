<p align="middle">`
<img width="648" height="245" src="config-files/logo.png">
</p>
<a href="https://github.com/GunzIvan28/rMAP/blob/master/LICENSE"><img alt="GitHub license" src="https://img.shields.io/github/license/GunzIvan28/rMAP?color=blue"></a>  

[![Anaconda-Server Badge](https://anaconda.org/gunzivan28/rmap/badges/platforms.svg)](https://anaconda.org/gunzivan28/rmap) [![Anaconda-Server Badge](https://anaconda.org/gunzivan28/rmap/badges/version.svg)](https://anaconda.org/gunzivan28/rmap) ![Conda](https://img.shields.io/conda/v/gunzivan28/rmap)
[![Anaconda-Server Badge](https://anaconda.org/gunzivan28/rmap/badges/latest_release_date.svg)](https://anaconda.org/gunzivan28/rmap) [![Anaconda-Server Badge](https://anaconda.org/gunzivan28/rmap/badges/downloads.svg)](https://anaconda.org/gunzivan28/rmap) 

Thorough easy-to-use resistome profiling bioinformatics pipeline for **ESKAPE** (_Enterococcus faecium_, _Staphylococcus aureus,_ _Klebsiella pneumoniae_, _Acinetobacter baumannii_, _Pseudomonas aeruginosa_, and _Enterobacter_ species) pathogens using Illumina Whole-genome sequencing (WGS) paired-end reads

## 🎬 Introduction

The evolution of the genomics era has led to generation of sequencing data at an unprecedented rate. Many bioinformatics tools have been created to analyze this data; however, very few tools can be utilized by individuals without prior reasonable bioinformatics training

rMAP(Rapid Microbial Analysis Pipeline) was designed using already pre-existing tools to automate analysis WGS Illumina paired-end data for the clinically significant ESKAPE group pathogens. It is able to exhaustively decode their resistomes whilst hiding the technical impediments faced by inexperienced users. Installation is fast and straight forward. A successful run generates a `.html` report that can be easily interpreted by non-bioinformatics personnel to guide decision making

## 🏷️ Pipeline Features

The rMAP pipeline toolbox is able to perform:

1. Download raw sequences from [NCBI-SRA](https://www.ncbi.nlm.nih.gov/sra/?term=) archive
2. Run quality control checks
3. Adapter and poor quality read trimming
4. De-novo assembly using [shovill](https://github.com/tseemann/shovill) or [megahit](https://github.com/voutcn/megahit)
5. Contig and scaffold annotation using [prokka](https://github.com/tseemann/prokka)
6. Variant calling using [freebayes](https://github.com/ekg/freebayes) and annotation using [snpEff](http://snpeff.sourceforge.net/)
7. SNP-based phylogeny inference using Maximum-Likelihood methods using [iqtree](https://github.com/Cibiv/IQ-TREE)
8. Antimicrobial resistance genes, plasmid, virulence factors and MLST profiling
9. [Insertion sequences](https://github.com/jhawkey/IS_mapper) detection
10. Interactive visual `.HTML` report generation using [R](https://www.r-project.org/) packages and [Markdown](https://www.markdownguide.org/) language

## ⚙️ Installation

Install [Miniconda](https://conda.io/miniconda.html) and run the following commands:  
**For Linux Users:** `wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh`  
`bash Miniconda3-latest-Linux-x86_64.sh`  

**For MacOS Users:** `wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh`  
`bash Miniconda3-latest-MacOSX-x86_64.sh`  


`export PATH=~/miniconda3/bin:$PATH` and source using `source ~/.bashrc`  
`git clone https://github.com/GunzIvan28/rMAP.git`  
`cd rMAP`  
`conda update -n base -y -c defaults conda`  

Select the appropriate installer for your computer (either `rMAP-1.0-Linux-installer.yml` or `rMAP-1.0-macOs-installer.yml`)

**For Linux Users**: `conda env create -n rMAP-1.0 --file rMAP-1.0-Linux-installer.yml`  
**For MacOS Users**: `conda env create -n rMAP-1.0 --file rMAP-1.0-macOs-installer.yml`  

`conda activate rMAP-1.0`  
`bash setup.sh`  
`cd && bash clean.sh`  
`rm -rf clean.sh`  
`rMAP -h`

```bash
This is rMAP 1.0
Developed and maintained by Ivan Sserwadda & Gerald Mboowa

SYPNOSIS:
    Bacterial analysis Toolbox for profiling the Resistome of ESKAPE pathogens using WGS paired-end reads

USAGE: 
    rMAP [options] --input <DIR> --output <OUTDIR> --reference <REF> 

GENERAL:
    -h/--help       Show this help menu
    -v/--version    Print version and exit
    -x/--citation   Show citation and exit

OBLIGATORY OPTIONS:
    -i/--input      Location of the raw sequences to be analyzed by the pipeline [either .fastq or .fastq.gz]

    -o/--output     Path and name of the output directory

    -r/--reference  Path to reference genome(.gbk). Provide '.gbk' to get annotated vcf files and insertion 
                    sequences  [default="REF.gbk"]  

    -c/--config     Install and configure full software dependencies  

OTHER OPTIONS:
    -d/--download   Download sequences from NCBI-SRA. Requires 'list.txt' of  sample ids saved at $HOME 
                    directory

    -f/--quality    Generate .html reports with quality statistics for the samples

    -q/--trim       Trims adapters off raw reads to a phred quality score[default=27]

    -a/--assembly   Perform De novo assembly [default=megahit] Choose either 'shovill' or 'megahit'

    -vc/--varcall   Generates SNPs for each sample and a merged 'all-sample ID' VCF file to be used to infer 
                    phylogeny in downstream analysis

    -t/--threads    Number of threads to use <integer> [default=4]

    -m/--amr        Profiles any existing antimicrobial resistance genes, virulence factors, mlsts and plasmids 
                    present within each sample id. 

    -p/--phylogeny  Infers phylogeny using merged all-sample ID VCF file to determine diversity and evolutionary 
                    relationships using Maximum Likelihood(ML) in 1000 Bootstraps
    
    -s/--pangenome  Perform pangenome analysis. A minimum of 3 samples should be provided to run this option
    
    -g/--gen-ele    Interrogates and profiles for mobile genomic elements(MGE) and insertion sequeces(IS) that 
                    may exist in the sequences
                     
For further explanation please visit: https://github.com/GunzIvan28/rMAP

```

Before starting the pipeline, run the command below to install and enjoy the full functionality of the software. This is done only once 
`rMAP -t 8 --config` or `rMAP -t 8 -c`

## 📀 Snippets of commandline arguments

**Using a sample-ID** `'list.txt'` **saved at** `$HOME`, **use rMAP to download sequences from** [NCBI-SRA](https://www.ncbi.nlm.nih.gov/sra/?term=)

`rMAP -t 8 --download`

**Perform a full run of rMAP using**
`rMAP -t 8 --reference mtb.gbk --input mtb --output mtb-full-run --quality --assembly shovill --amr --varcall --phylogeny --pangenome --gen-ele`

**The short notation for the code above can be run as follows**:  
`rMAP -t 8 -r mtb.gbk -i mtb -o mtb-full-run -f -a shovill -m -vc -p -s -g`

## 📝 Information

### How to cite

Not yet published

### 🎞️ Credits

This pipeline was written by Ivan Sserwadda [GunzIvan28](https://github.com/GunzIvan28) and Gerald Mboowa [gmboowa](https://github.com/gmboowa). If you want to contribute, please open an issue or a pull request and ask to be added to the project - everyone is welcome to contribute

### ✍️ Authors
* [Ivan Sserwadda](https://github.com/GunzIvan28)
* [Gerald Mboowa](https://github.com/gmboowa)

### 🔌 Third Party Plugins

This softwares' foundation is built using pre-existing tools. When using it, please don't forget to cite the following:

* [ABRicate=1.0.1](https://github.com/tseemann/abricate)
* [FastQC=0.11.9](https://github.com/s-andrews/FastQC)
* [MultiQC=1.9](https://github.com/ewels/MultiQC)
* [Snippy=4.3.6](https://github.com/tseemann/snippy)
* [SnpEff=4.5covid19](https://github.com/pcingola/SnpEff)
* [AMRFinderPlus=3.8.4](https://www.ncbi.nlm.nih.gov/pathogens/antimicrobial-resistance/AMRFinder/)
* [Prokka=1.14.6](https://github.com/tseemann/prokka)
* [Prodigal=2.6.3](https://github.com/hyattpd/Prodigal)
* [Freebayes=1.3.2](https://github.com/ekg/freebayes)
* [Unicycler=0.4.8](https://github.com/rrwick/Unicycler)
* [Mlst=2.19.0](https://github.com/tseemann/mlst)
* [Assembly-stats=1.0.1](https://github.com/sanger-pathogens/assembly-stats)
* [SRA-Tools=2.10.8](https://github.com/ncbi/sra-tools)
* [BWA=0.7.17](https://github.com/lh3/bwa)
* [Kleborate=1.0.0](https://github.com/katholt/Kleborate)
* [Mafft=7.471](https://mafft.cbrc.jp/alignment/software/)
* [Quast=5.0.2](http://quast.sourceforge.net/quast)
* [R-base=4.0.2](https://cran.r-project.org/)
* [Trimmomatic=0.39](http://www.usadellab.org/cms/?page=trimmomatic)
* [Megahit=1.2.9](https://github.com/voutcn/megahit)
* [Parallel=20200722](https://www.gnu.org/software/parallel/)
* [Shovill=1.0.9](https://github.com/tseemann/shovill)
* [Vt=2015.11.10](https://github.com/atks/vt)
* [Fasttree=2.1.10](http://www.microbesonline.org/fasttree/)
* [Samclip=0.4.0](https://github.com/tseemann/samclip/)
* [Nextflow=20.07.1](https://github.com/nextflow-io/nextflow)
* [Any2fasta=0.4.2](https://github.com/tseemann/any2fasta)
* [Biopython.convert=1.0.3](https://github.com/biopython/biopython)
* [Iqtree=2.0.3](https://github.com/Cibiv/IQ-TREE)
* [Bmge=1.12](https://bmcevolbiol.biomedcentral.com/articles/10.1186/1471-2148-10-210)
* [Tormes=1.1](https://github.com/nmquijada/tormes)
* [Samtools=1.9](https://github.com/samtools/samtools)
* [Roary=3.13.0](https://sanger-pathogens.github.io/Roary/)
* [ISmapper=2.0.1](https://github.com/jhawkey/IS_mapper)
* [Cairosvg=2.4.2](https://github.com/Kozea/CairoSVG)

### 🐛 To report bugs, ask questions or seek help

The software developing team works round the clock to ensure the bugs within the program are captured and fixed.
For support or any inquiry: 
You can submit your query using the [Issue Tracker](https://github.com/GunzIvan28/rMAP/issues)    



<p align="middle">
<img width="647" height="323" src="config-files/footer.png">
</p>
