# Medical R Figure Optimizer

`medical-r-figure-optimizer` is a Codex skill for polishing medical R figures used in clinical statistics, omics analysis, and single-cell workflows.

It helps with:

- Choosing suitable R packages for common biomedical figures
- Restyling figures for publication-ready output
- Applying Nature-like, Cell-like, or clinically clear presentation patterns
- Returning reusable R code instead of one-off manual edits

## Typical Figure Types

- Kaplan-Meier curves
- Forest plots
- ROC and time-dependent ROC plots
- Nomograms and calibration plots
- Heatmaps
- Volcano plots
- PCA, UMAP, and t-SNE plots
- Enrichment plots
- Single-cell visualization panels

## Main Package Stack

- `ggplot2`
- `survminer`
- `rms`
- `pROC`
- `timeROC`
- `ComplexHeatmap`
- `clusterProfiler`
- `enrichplot`
- `Seurat`
- `ggsci`
- `ggprism`

## Repository Layout

```text
.
├── SKILL.md
├── agents/openai.yaml
├── references/
└── scripts/
```

## Install Locally

Copy this repository into your Codex skills directory as:

```text
~/.codex/skills/medical-r-figure-optimizer
```

Then restart Codex so the new skill is discovered.

## Key Files

- `SKILL.md`: main skill instructions and triggering description
- `references/medical-figure-landscape.md`: plot families and package mapping
- `references/journal-style-guide.md`: styling heuristics
- `references/sources.md`: source links
- `scripts/medical_plot_helpers.R`: reusable R theme and export helpers
