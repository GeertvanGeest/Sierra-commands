#!/usr/bin/env Rscript
library("optparse")
 
option_list <- list(
    make_option(c("-o", "--output_file"), type = "character", default = "peaks_merged.txt", help = "file to write the set of merged peaks to [default = %default]"),
    make_option(c("-c", "--ncores"), type = "integer", default = 1, help = "Number of cores[default= %default]")
)

opt_parser <- OptionParser("%prog [options] peaks1.txt peaks2.txt [peaks3.txt ..]", option_list=option_list, 
  description = "Takes as input a list of named peaks obtained from running peak calling on multiple data-sets. First goes through each peak set and check what peaks within each set should be merged (self-merging). Merging is based on similarity criteria set by sim.thresh and allow.match.var. Then compares each peak set as a reference to the remaining sets to identify peaks that should be merged. Returns a list of peaks that have been merged, as well as the unique peaks from each data-set.")
opt <- parse_args(opt_parser, positional_arguments = c(0, Inf))

# print(opt)
### Read in the tables, extract the peak names and run merging ###

ids <- gsub(".txt", "", opt$args)

peak.dataset.table = data.frame(Peak_file = opt$args,
  Identifier = ids, 
  stringsAsFactors = FALSE)

# write.table(peak.dataset.table, stdout())

MergePeakCoordinates(
  peak.dataset.table, 
  output.file = opt$output_file, 
  ncores = opt$ncores)
