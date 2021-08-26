
install.packages(c("optparse", "devtools", "BiocManager"))
BiocManager::install(c("Rsamtools", "GenomicAlignments", "Gviz", "DEXSeq", "BSgenome", "GenomicFeatures", "rtracklayer"))

# BiocManager::install("GenomicAlignments", "SingleCellExperiment", "Gviz", "DEXSeq", )
devtools::install_github("VCCRI/Sierra", build = TRUE)
