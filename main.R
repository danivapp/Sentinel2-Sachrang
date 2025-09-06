# ---- Setup ----
  # install.packages(c("RStoolbox","terra","ggplot2"))
  library(RStoolbox)
  library(terra)
  library(ggplot2)
  
  # set up environment
  setwd("/Users/dana/Documents/code/R/Sentinel2-Sachrang")
  dir.create("outputs", showWarnings = FALSE)
  path <- "/Users/dana/Documents/code/R/Sentinel2-Sachrang"
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

# ---- 1) RGB composites ----
  # True-color composite (B04=red, B03=green, B02=blue)
  png("outputs/rgb_truecolor.png", width = 1100, height = 900, res = 150)
  plotRGB(s2, r = "B04", g = "B03", b = "B02", stretch = "lin")
  dev.off()
  
  # False-color composite (B08=nir, B04=red, B03=green)
  png("outputs/rgb_falsecolor.png", width = 1100, height = 900, res = 150)
  plotRGB(s2, r = "B08", g = "B04", b = "B03", stretch = "sqrt")
  dev.off()
  