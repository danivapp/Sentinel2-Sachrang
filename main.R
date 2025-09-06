# ---- Setup ----
# install.packages(c("RStoolbox","terra","ggplot2"))
library(RStoolbox)
library(terra)
library(ggplot2)

# set up environment
setwd("/Users/dana/Documents/code/RStoolbox")
dir.create("outputs", showWarnings = FALSE)
path <- "/Users/dana/Documents/code/RStoolbox/data"
if (!dir.exists(path)) stop("Folder not found: ", path)