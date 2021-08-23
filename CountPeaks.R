#!/usr/bin/env Rscript
library("optparse")
 
option_list <- list(
    make_option(c("-p", "--peaks"), type="character", help="Input (merged) peaks file"),
    make_option(c("-g", "--gtf"), type="character", help="Input GTF"),
    make_option(c("-b", "--bam"), type="character", help="Input BAM"),
    make_option(c("-w", "--whitelist"), type="character", help="Barcode whitelist"),
    make_option(c("-o", "--outputdir"), type = "character", default = "sierra_out", help = "Output directory [default = %default]"),
    make_option(c("-c", "--ncores"), type = "integer", default = 1, help = "Number of cores[default= %default]"),
    make_option(c("-u", "--noUMI"), action="store_true", default=FALSE, help = "Boolean. Do not count UMI [default= %default]")
)
 
opt_parser <- OptionParser(option_list=option_list)
opt <- parse_args(opt_parser)

# print(opt)


library(Sierra)
CountPeaks(peak.sites.file = opt$peaks, 
           gtf.file = opt$gtf,
           bamfile = opt$bam, 
           whitelist.file = opt$whitelist,
           output.dir = opt$outputdir, 
           countUMI = !opt$noUMI, 
           ncores = opt$ncores)
