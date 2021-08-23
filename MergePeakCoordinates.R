#!/usr/bin/env Rscript
library("optparse")
 
option_list <- list(
    make_option(c("-o", "--output"), type = "character", default = "peaks_merged.txt", help = "Output file [default = %default]"),
    make_option(c("-c", "--ncores"), type = "integer", default = 1, help = "Number of cores[default= %default]")
)

opt_parser <- OptionParser("%prog [options] peaks1.txt peaks2.txt [peaks3.txt ..]", option_list=option_list)
opt <- parse_args(opt_parser, positional_arguments = c(0, Inf))

# print(opt)
### Read in the tables, extract the peak names and run merging ###

ids <- gsub(".txt", "", opt$args)

peak.dataset.table = data.frame(Peak_file = opt$args,
  Identifier = ids, 
  stringsAsFactors = FALSE)

# write.table(peak.dataset.table, stdout())

MergePeakCoordinates(peak.dataset.table, output.file = opt$output, ncores = opt$ncores)
