# Sierra commands

Code for calling resource intensive functions of [Sierra](https://github.com/VCCRI/Sierra).

## Installation

Dependencies are:
- `optparse` (CRAN)
- `devtools` (CRAN)
- `BiocManager` (CRAN)
- `Sierra` (github)

Install them like so:

```
install.packages(c("optparse", "devtools", "BiocManager"))
# some bug fixes in geertvangeest
# will change to VCCRI if fixed
devtools::install_github("geertvangeest/Sierra", build = TRUE)
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
Usage: AnnotatePeaksFromGTF.R [options]


Options:
        -p PEAKS, --peaks=PEAKS
                Input (merged) peaks file

        -g GTF, --gtf=GTF
                Input GTF

        -o OUTPUT, --output=OUTPUT
                Output file [default = peak_annotations.txt]

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
