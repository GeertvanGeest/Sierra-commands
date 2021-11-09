#!/usr/bin/env Rscript
library("optparse")
 
option_list <- list(
    make_option(c("-p", "--peaks_sites_file"), type="character", help="a file of peak coordinates."),
    make_option(c("-g", "--gtf_file"), type="character", help="GTF reference file."),
    make_option(c("-o", "--output_file"), type = "character", default = "peak_annotations.txt", help = "file to write the annotations to [default = %default]"),
    make_option(c("-r", "--genome"), type="character", help="BSGenome package (e.g. BSgenome.Mmusculus.UCSC.mm10). Will be installed if not available"),
    make_option(c("-l", "--library"), type = "character", default = "~/.singularityR/", help = "Path in which to install BSGenome package (should be writeable)")
)
 
opt_parser <- OptionParser(option_list=option_list)
opt <- parse_args(opt_parser)
# print(opt)
# As previously defined
# peak.merge.output.file <- "TIP_merged_peaks.txt"
# extdata_path <- system.file("extdata",package = "Sierra")
# reference.file <- paste0(extdata_path,"/Vignette_cellranger_genes_subset.gtf")

# New definitions
# genome <- BSgenome.Mmusculus.UCSC.mm10::BSgenome.Mmusculus.UCSC.mm10
library(Sierra)

dir.create(opt$library, recursive = TRUE)
.libPaths(opt$library)
BiocManager::install(opt$genome, ask = FALSE, update = FALSE)
library(opt$genome, character.only = TRUE)

AnnotatePeaksFromGTF(peak.sites.file = opt$peaks_sites_file, 
                     gtf.file = opt$gtf_file,
                     output.file = opt$output_file, 
                     genome = get(opt$genome))

