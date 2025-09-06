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


