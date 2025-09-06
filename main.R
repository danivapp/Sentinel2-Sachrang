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
  
  # load Sentinel-2 L2A tiles from Sachrang - from Copernicus
  files <- list.files(path, pattern = "\\.(tif|tiff|jp2)$", full.names = TRUE,
                      ignore.case = TRUE, recursive = TRUE)
  # print(files) - check the order
  s2 <- rast(files)
  names(s2) <- c("B02","B03","B04","B08","B11","B12")
  
  # quick check 
  s2
  plotRGB(s2, r=3, g=2, b=1, stretch="lin")
  
  # confirm 16-bit analytical data
  for (nm in names(s2)) {
    rng <- as.vector(global(s2[[nm]], "range", na.rm = TRUE))
    cat(sprintf("%s: min=%.2f max=%.2f\n", nm, rng[1], rng[2]))
  }