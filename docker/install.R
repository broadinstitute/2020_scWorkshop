## CRAN Packages
install.packages('umap')
# install.packages("ggplot2")
install.packages("gam")
# install.packages("ggbeeswarm")
# install.packages("ggthemes")
# install.packages("dplyr")
# install.packages("plyr")
# install.packages("Matrix")
# install.packages("fossil")
install.packages("BiocManager")
# install.packages("devtools")
# install.packages('rmarkdown')
#install.packages("rgl", dependencies=TRUE)

## Bioconductor Packages
#BiocManager::install("SingleCellExperiment", version = "3.8", update = FALSE)
#BiocManager::install("destiny", update = FALSE)
#BiocManager::install("slingshot", update = FALSE)
#BiocManager::install("splatter", update = FALSE)
#BiocManager::install("scater", update = FALSE)
#BiocManager::install("DropletUtils", update = FALSE)
#BiocManager::install("pcaMethods", update = FALSE)
BiocManager::install("CountClust", update = FALSE)


## Github Packages
devtools::install_github("satijalab/seurat", upgrade = "never")
#devtools::install_github("broadinstitute/inferCNV")
#devtools::install_github("velocyto-team/velocyto.R")
#devtools::install_github('MacoskoLab/liger')
