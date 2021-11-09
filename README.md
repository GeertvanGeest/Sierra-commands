# Sierra commands

Code for calling resource intensive functions of [Sierra](https://github.com/VCCRI/Sierra).

## Installation

Dependencies are:
- `optparse` (CRAN)
- `devtools` (CRAN)
- `Sierra` (github)

Install them like so:

```
install.packages(c("optparse", "devtools"))
devtools::install_github("VCCRI/Sierra", build = TRUE)
```

### Docker

```sh
docker pull geertvangeest/sierra:latest
```

### Singularity

```sh
singularity pull docker://geertvangeest/sierra:latest
```

## Usage 

The functions `FindPeaks`, `CountPeaks`, `MergePeakCoordinates` and `AnnotatePeaksFromGTF` are incorporated in a shell script and callable from the command line. You find them in the directory [scripts](scripts). Get usage info by typing `Rscript [function].R -h`.
E.g. `Rscript AnnotatePeaksFromGTF.R -h` results in: 

```
Usage: ./scripts/AnnotatePeaksFromGTF.R [options]
Annotate a set of peak coordinates according to genomic features the coordinates fall on - 3'UTR, exon, intron and 5'UTR, and annotate proximity to motifs. Motifs include the canonical polyA motif, A-rich regions and T-rich regions.

Options:
        -p PEAKS_SITES_FILE, --peaks_sites_file=PEAKS_SITES_FILE
                a file of peak coordinates.

        -g GTF_FILE, --gtf_file=GTF_FILE
                GTF reference file.

        -o OUTPUT_FILE, --output_file=OUTPUT_FILE
                file to write the annotations to [default = peak_annotations.txt]

        -r GENOME, --genome=GENOME
                BSGenome package (e.g. BSgenome.Mmusculus.UCSC.mm10). Will be installed if not available

        -l LIBRARY, --library=LIBRARY
                Path in which to install BSGenome package (should be writeable)

        -h, --help
                Show this help message and exit
```

### Docker

For example for `AnnotatePeaksFromGTF.R`:

```sh
docker run --rm geertvangeest/sierra AnnotatePeaksFromGTF.R -h
```

### Singularity

For example for `AnnotatePeaksFromGTF.R`:

```sh
./sierra_latest.sif AnnotatePeaksFromGTF.R -h
```

or 
```sh
singularity exec ./sierra_latest.sif AnnotatePeaksFromGTF.R -h
```
