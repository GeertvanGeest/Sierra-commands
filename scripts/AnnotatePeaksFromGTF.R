#!/usr/bin/env Rscript
library("optparse")
 
option_list <- list(
    make_option(c("-p", "--peaks"), type="character", help="Input (merged) peaks file"),
    make_option(c("-g", "--gtf"), type="character", help="Input GTF"),
    make_option(c("-o", "--output"), type = "character", default = "peak_annotations.txt", help = "Output file [default = %default]"),
    make_option(c("-r", "--genome"), type="character", help="BSGenome packages (e.g. BSgenome.Mmusculus.UCSC.mm10. Will be installed if not available"),
)
 
opt_parser <- OptionParser(option_list=option_list)
opt <- parse_args(opt_parser)
# As previously defined
# peak.merge.output.file <- "TIP_merged_peaks.txt"
# extdata_path <- system.file("extdata",package = "Sierra")
# reference.file <- paste0(extdata_path,"/Vignette_cellranger_genes_subset.gtf")

# New definitions
# genome <- BSgenome.Mmusculus.UCSC.mm10::BSgenome.Mmusculus.UCSC.mm10
library(Sierra)
BiocManager::install(opt$genome, ask = FALSE)
library(opt$genome)

AnnotatePeaksFromGTF(peak.sites.file = opt$peaks, 
                     gtf.file = opt$gtf,
                     output.file = opt$output, 
                     genome = opt$genome)
                     