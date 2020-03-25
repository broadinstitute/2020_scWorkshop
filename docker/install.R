## CRAN Packages
install.packages('umap')
install.packages("corrplot")
install.packages("gam")
install.packages("ggbeeswarm")
install.packages("ggthemes")
install.packages("plyr")
# install.packages("Matrix")
install.packages("fossil")
install.packages("BiocManager")
# install.packages("devtools")
# install.packages('rmarkdown')
#install.packages("rgl", dependencies=TRUE)


## Bioconductor Packages
BiocManager::install("SingleCellExperiment", update = FALSE)
BiocManager::install("destiny", update = FALSE)
BiocManager::install("slingshot", update = FALSE)
BiocManager::install("clusterExperiment", update = FALSE)
BiocManager::install("scater", update = FALSE)


## Github Packages
devtools::install_github("satijalab/seurat", upgrade = "never")
devtools::install_github('TaddyLab/maptpx')
devtools::install_github('kkdey/CountClust')
#devtools::install_github("broadinstitute/inferCNV")
#devtools::install_github("velocyto-team/velocyto.R")
devtools::install_github('MacoskoLab/liger')
