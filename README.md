# Sentinel-2 Land Cover Classification – Sachrang, Bavaria

The project was created as part of my **preparation for an interview** (September 2025) and contains an exploratory remote sensing analysis of Sentinel-2 data over **Sachrang**, a small village in the Bavarian Alps.  
It also reflects my personal connection to this area — it is idyllic in all seasons and hosts a vivid summer program.

![Sachrang village, framed by Alps](https://www.aschau.de/images/lcctesbiuka-/bergsteigerdorf-sachrang.jpeg)

---

## Analysis Workflow
👉 [analysis in R](Sentinel2-Sachrang/main.R)

1. Data loading
2. RGB composites
3. Spectral indices
4. PCA
5. Unsupervised clustering (k=5) 
6. Class consolidation (3 classes)
7. Summaries

Detailed interpretation of all **results** (with figures and tables) can be found here:  
👉 [Results](docs/interpretation.md)

---

## Disclaimer

This project is **exploratory** and designed to demonstrate the use of R (`terra`, `RStoolbox`, `ggplot2`) for remote sensing workflows. Cluster labeling and class consolidation were done **post-hoc** after inspecting the data.
