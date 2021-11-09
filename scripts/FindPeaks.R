#!/usr/bin/env Rscript
library("optparse")
 
option_list <- list(
    make_option(c("-g", "--gtf_file"), type="character", help="reference (GTF) file"),
    make_option(c("-b", "--bamfile"), type="character", help="scRNA-seq BAM file"),
    make_option(c("-j", "--junctions_file"), type="character", help="BED file (as produced by regtools) or SJ.out.tab file (STAR aligner) containing splice junction coordinates"),
    make_option(c("-o", "--output_file"), type = "character", default = "peaks.txt", help = "a file containing polyA sites [default = %default]"),
    make_option(c("-c", "--ncores"), type = "integer", default = 1, help = "Number of cores [default= %default]"),
    make_option(c("-s", "--gene_symbol_ref"), type = "character", default = "gene_name", help = "field in the GTF file containing the gene symbol"),
    make_option(c("--min_jcutoff"), type = "integer", default = 50, help = "minimum number of spliced reads across a junction for it to be considered [default = %default]"),
    make_option(c("--min_jcutoff_prop"), type = "double", default = 0.05, help = "minimum proportion of junction reads out of all junction reads for that gene [default = %default]")

)
 
opt_parser <- OptionParser(option_list=option_list, description = "
Takes as input a BAM file produced from barcoded scRNA-seq experiment, the reference (GTF) file used during alignment and a BED file of junctions produced by regtools. For each gene in the reference file, the peak calling process first splits the read coverage into 'across junction' and 'no junction' subsets. Within each subset, the site of maximum coverage is identified and a peak called, by fitting a Gaussian to the read coverage, from a 600bp window around this region. After calling a peak, the local read coverage is removed and the next site of maximum coverage is identified. This process runs iteratively until at least one of two stopping criteria are reached. The first criteria is defined as the maximum read coverage a minimum cutoff (min.cov.cutoff) and proportion (min.cov.prop). The second critera is the size of the peak, including a absolute threshold (min.peak.cutoff) and a relative threshold (min.peak.prop).")
opt <- parse_args(opt_parser)

# print(opt)

library(Sierra)
FindPeaks(output.file = opt$output_file,   # output filename
          gtf.file = opt$gtf_file,           # gene model as a GTF file
          bamfile = opt$bamfile,                # BAM alignment filename.
          junctions.file = opt$junctions_file,     # BED filename of splice junctions exising in BAM file. 
          ncores = opt$ncores,          # number of cores to use
          gene.symbol.ref = opt$gene_symbol_ref,
          min.jcutoff = opt$min_jcutoff,
          min.jcutoff.prop = opt$min_jcutoff_prop)                          
