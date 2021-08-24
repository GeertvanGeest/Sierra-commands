#!/usr/bin/env Rscript
library("optparse")
 
option_list <- list(
    make_option(c("-g", "--gtf"), type="character", help="Input GTF"),
    make_option(c("-b", "--bam"), type="character", help="Input BAM"),
    make_option(c("-j", "--junctions"), type="character", help="junctions BED file"),
    make_option(c("-o", "--output"), type = "character", default = "peaks.txt", help = "Output file [default = %default]"),
    make_option(c("-c", "--ncores"), type = "integer", default = 1, help = "Number of cores[default= %default]"),
    make_option(c("-s", "--symbol_field"), type = "character", default = "gene_name", help = "field in the GTF file containing the gene symbol")
)
 
opt_parser <- OptionParser(option_list=option_list)
opt <- parse_args(opt_parser)

# print(opt)

library(Sierra)
FindPeaks(output.file = opt$output,   # output filename
          gtf.file = opt$gtf,           # gene model as a GTF file
          bamfile = opt$bam,                # BAM alignment filename.
          junctions.file = opt$junctions,     # BED filename of splice junctions exising in BAM file. 
          ncores = opt$ncores,          # number of cores to use
          gene.symbol.ref = opt$symbol_field)                          
