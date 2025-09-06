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
  files <- list.files(path, pattern = "\\.(tiff|jp2)$", full.names = TRUE,
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

# ---- 2) Spectral indices ----

  graphics.off()
  dev.cur()
  
  # 1) Recompute indices
  inds <- spectralIndices(
    s2,
    green = "B03",
    red   = "B04",
    nir   = "B08",
    swir1 = "B11",
    swir2 = "B12",
    scaleFactor = 65535
  )
  
  # Add manual NDBI 
  num   <- s2[["B11"]] - s2[["B08"]]
  denom <- s2[["B11"]] + s2[["B08"]]
  ndbi  <- num / denom
  ndbi[denom == 0] <- NA
  names(ndbi) <- "NDBI"
  inds[["NDBI"]] <- ndbi
  
  # 2x2 panel of key indices
  plot_indices <- function(x, picks = c("NDVI","NDWI","NDBI","MSAVI")) {
    picks <- intersect(picks, names(x))
    if (!length(picks)) { warning("No matching indices to plot"); return(invisible(NULL)) }
    op <- par(mfrow = c(2,2), mar = c(2,2,2,1))
    on.exit(par(op), add = TRUE)
    for (nm in picks) plot(x[[nm]], main = nm)
  }
  
  png("outputs/indices_panel.png", width = 1600, height = 1200, res = 150)
  plot_indices(inds, c("NDVI","NDWI","MSAVI","NDBI"))
  dev.off()
  
# ---- 3) PCA ----
  bands_for_pca <- c("B02","B03","B04","B08","B11","B12")
  pca <- rasterPCA(s2[[bands_for_pca]], nSamples = 10000, spca = FALSE, maskCheck = FALSE)
  names(pca)
  
  # Variance explained
  sdev <- pca$model$sdev
  ve <- (sdev^2) / sum(sdev^2)
  png("outputs/pca_variance.png", width=1100, height=700, res=150)
  barplot(ve, xlab="Principal Component", ylab="Variance explained", main="PCA variance explained")
  dev.off()
  
  # RGB composite of first 3 PCs
  png("outputs/pca_rgb.png", width=1100, height=900, res=150)
  plotRGB(pca$map, r=1, g=2, b=3, stretch="lin")
  dev.off()
  