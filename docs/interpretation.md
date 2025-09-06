# Sentinel-2 Analysis of Sachrang

## Step 1: RGB Composites

The true-color composite (Bands 4-3-2) shows the landscape as seen by the human eye:  

![True color](../outputs/rgb_truecolor.png)

The false-color composite (Bands 8-4-3) highlights vegetation in red tones:  

![False color](../outputs/rgb_falsecolor.png)

Compared to true color, vegetation health and land-use patterns stand out much more clearly.

## Step 2 – Spectral Indices

![Spectral Indices Panel](../outputs/indices_panel.png)

---

### NDVI – Normalized Difference Vegetation Index  
- Highlights vegetation health and density.  
- Values near **0.7–0.9** indicate **dense forest canopy** and healthy meadows.  
- Lower values (<0.3) correspond to **roads, rooftops, or bare ground**.  

---

### NDWI – Normalized Difference Water Index  
- Sensitive to **surface water and vegetation moisture**.  
- Most of the scene is **dry (low values)**, as expected in alpine uplands.  
- Brighter pixels may mark **wetter soils or river corridors**.  

---

### MSAVI – Modified Soil-Adjusted Vegetation Index  
- Similar to NDVI but reduces soil brightness influence.  
- Useful for **agriculture and grasslands** where vegetation is sparse.  
- High values align with **active crop or grass areas**.  

---

### NDBI – Normalized Difference Built-up Index  
- Distinguishes **built-up areas vs. vegetation**.  
- Positive values (yellow) → **villages, roads, rooftops**.  
- Negative values (blue) → **vegetated surfaces**.  

---

**Takeaway:**  
Sachrang is dominated by **healthy vegetation**, with **little open water**, and villages that are clearly highlighted in **NDBI** against the natural background.


# Step 3 – Principal Component Analysis (PCA)

We applied PCA to the six Sentinel-2 reflective bands (B02, B03, B04, B08, B11, B12) to reduce dimensionality and explore dominant spectral patterns.

---

### Variance Explained

![PCA Variance Explained](../outputs/pca_variance.png)

- Most of the spectral variability can be summarized in just the first 2 components (PC1 ~ 85%; PC2 ~ 12%)

---

### RGB Composite of Principal Components

![PCA RGB Composite](../outputs/pca_rgb.png)

- The PCA composite highlights **contrasts between land-cover types**:  
  - **Bright red/orange patches** → agricultural fields and open areas with distinct spectral signals.  
  - **Green-yellow tones** → vegetated zones, especially forested areas.  
  - **Blue/purple areas** → likely shadowed terrain or spectrally mixed pixels.  
- Roads and built-up areas appear **bright linear features**, standing out against the natural background.  

---

**Takeaway:**  
 **PC1+PC2 already summarize ~97% of variability**, enabling clearer separation of land-cover classes (forest, meadows, settlements) while reducing noise and redundancy across bands.


