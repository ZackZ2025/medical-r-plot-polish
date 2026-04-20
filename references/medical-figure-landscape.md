# Medical Figure Landscape

Use this file to map common biomedical plot requests to the most useful R packages and styling priorities.

## Clinical Statistics

### Kaplan-Meier and other survival plots

- Core packages: `survival`, `survminer`, `ggplot2`
- Typical requests: risk table, p-value, median survival annotation, subgroup overlays
- Styling priorities: readable censor marks, compact legends, matching line types, a risk table that does not overpower the plot

### Forest plots for regression or subgroup analysis

- Core packages: `ggplot2`, `forestmodel`, `broom`, `dplyr`
- Typical requests: Cox or logistic regression, subgroup effect estimates, confidence intervals
- Styling priorities: left-aligned labels, generous row spacing, muted reference line, bold group headers only when necessary

### ROC and time-dependent ROC

- Core packages: `pROC`, `timeROC`, `ggplot2`
- Typical requests: compare models, annotate AUC, bootstrap confidence intervals, fixed time horizons
- Styling priorities: high line contrast, sparse gridlines, direct model labeling when feasible

### Nomograms and calibration plots

- Core packages: `rms`
- Typical requests: prognostic models, calibration curves, decision support graphics
- Styling priorities: conservative color, clear tick labels, enough white space for dense clinical annotation

### Boxplots, violin plots, dot plots, and paired comparisons

- Core packages: `ggplot2`, `ggpubr`, `rstatix`
- Typical requests: treatment groups, biomarker distributions, paired before-after comparisons
- Styling priorities: show raw points when sample size permits, avoid oversaturated fills, use exact group labels

### Alluvial and Sankey-like flow plots

- Core packages: `ggalluvial`, `ggplot2`
- Typical requests: response shift, stage migration, subtype transitions
- Styling priorities: limit category count, keep labels short, use a stable palette across stages

## Bulk Omics and Systems Biology

### Heatmaps

- Core packages: `ComplexHeatmap`, `circlize`
- Typical requests: expression matrices, mutation summaries, clustered annotation tracks
- Styling priorities: meaningful color scale, legible row or column annotation, explicit clustering choices

### Volcano plots

- Core packages: `ggplot2`, `EnhancedVolcano`
- Typical requests: differential expression, highlighted genes, labeled top hits
- Styling priorities: limit label count, keep threshold lines subtle, use semantic coloring for up, down, nonsignificant

### PCA, UMAP, and t-SNE

- Core packages: `ggplot2`, `factoextra`, `Seurat`
- Typical requests: cohort separation, batch effect checks, cell embedding visualization
- Styling priorities: equal point sizing logic, alpha for dense regions, minimal axes when embeddings are dimensionless

### Enrichment dotplots, barplots, cnetplots, emapplots, ridgeplots

- Core packages: `clusterProfiler`, `enrichplot`
- Typical requests: GO, KEGG, GSEA, pathway overlap
- Styling priorities: cap category count, sort by a clear metric, shorten long pathway names without changing meaning

### Oncoplots and mutation summaries

- Core packages: `ComplexHeatmap`, `maftools`
- Typical requests: mutation landscape, pathway-level mutation frequency, clinical annotations
- Styling priorities: consistent alteration colors, controlled annotation density, readable sample ordering

## Single-Cell

### Dimensional reduction plots

- Core packages: `Seurat`, `ggplot2`
- Typical requests: cluster labels, split-by condition, highlighted cell populations
- Styling priorities: alpha and point size tuned for density, labels that do not obscure clusters, consistent color mapping across panels

### Feature and violin plots

- Core packages: `Seurat`, `patchwork`
- Typical requests: marker expression, condition comparisons, multi-gene panels
- Styling priorities: matched scales when comparison matters, restrained gradients, compact legends

## Package Selection Heuristics

- Prefer `ggplot2` when the figure is fundamentally statistical and you want full theming control.
- Prefer `survminer`, `rms`, `pROC`, or `timeROC` when the domain package already solves the statistical annotations cleanly.
- Prefer `ComplexHeatmap` for any nontrivial heatmap with annotations, splits, or multiple aligned tracks.
- Prefer `clusterProfiler` plus `enrichplot` for pathway enrichment visualization.
- Prefer `Seurat` for single-cell objects, then post-process with `ggplot2` or layout packages when needed.

## Core Package References

- `ggplot2`: general plotting grammar and theming
- `survminer`: survival curves on top of `ggplot2`
- `rms`: regression modeling, calibration, and nomograms
- `pROC`: ROC curve analysis
- `timeROC`: time-dependent ROC curves
- `ComplexHeatmap`: rich heatmap systems for omics data
- `clusterProfiler` and `enrichplot`: enrichment analysis and visualization
- `Seurat`: single-cell exploration and visualization
- `ggsci`: Nature-style and other scientific palettes
- `ggprism`: Prism-inspired themes and palettes
