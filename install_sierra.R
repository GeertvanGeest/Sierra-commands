
# BiocManager::install("GenomicAlignments", "SingleCellExperiment", "Gviz", "DEXSeq", )
devtools::install_github("VCCRI/Sierra", build = TRUE, build_vignettes = FALSE, dependencies = TRUE, build_opts = c("--no-resave-data", "--no-manual"))
