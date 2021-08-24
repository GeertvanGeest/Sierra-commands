
install.packages(c("optparse", "devtools", "BiocManager"))
BiocManager::install(c("Rsamtools", "GenomicAlignments", "Gviz", "DEXSeq", "BSgenome", "GenomicFeatures", "rtracklayer"))

# BiocManager::install("GenomicAlignments", "SingleCellExperiment", "Gviz", "DEXSeq", )
devtools::install_github("geertvangeest/Sierra", build = TRUE, build_vignettes = FALSE, dependencies = TRUE, build_opts = c("--no-resave-data", "--no-manual"))
