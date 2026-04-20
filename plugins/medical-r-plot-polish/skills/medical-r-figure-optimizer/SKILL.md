---
name: medical-r-figure-optimizer
description: Use when the user wants to optimize, restyle, or standardize medical R figures for manuscripts, supplements, posters, or slides, especially for clinical statistics and omics plots such as Kaplan-Meier curves, forest plots, ROC plots, nomograms, heatmaps, volcano plots, PCA or UMAP, and enrichment figures.
---

# Medical R Figure Optimizer

## Overview

This skill helps Codex turn rough medical R plots into cleaner, publication-ready figures for clinical and omics workflows. It focuses on choosing the right plotting package, applying journal-appropriate styling, and returning reusable R code instead of one-off manual tweaks.

## Use This Skill When

- The request involves R plotting for medical, clinical, translational, bioinformatics, or omics work.
- The user wants to beautify an existing figure or asks for Nature-like, Cell-like, Prism-like, or publication-ready styling.
- The task needs package selection for common biomedical plots.
- The user needs figure code that is easy to rerun across cohorts, subgroups, or datasets.

## Workflow

1. Classify the figure family before editing.
   Clinical statistics usually maps to survival curves, forest plots, ROC or time-dependent ROC, nomograms, box or violin plots, alluvial plots, and longitudinal line plots.
   Omics usually maps to heatmaps, volcano plots, PCA, UMAP, t-SNE, enrichment dotplots, network plots, oncoplots, and single-cell marker expression plots.
2. Read the relevant reference file.
   Use [medical-figure-landscape.md](references/medical-figure-landscape.md) for plot-to-package mapping.
   Use [journal-style-guide.md](references/journal-style-guide.md) for styling rules and export settings.
3. Prefer a package stack that matches the figure type.
   Start from `ggplot2` for most clinical plots.
   Use domain packages such as `survminer`, `rms`, `pROC`, `timeROC`, `ComplexHeatmap`, `clusterProfiler`, `enrichplot`, or `Seurat` when they provide the right geometry or annotation model.
4. Restyle with intent, not decoration.
   Remove chartjunk, keep legends compact, standardize font sizes, use restrained color, and make panel layouts readable at manuscript scale.
5. Return reusable code and export settings.
   Default to vector output for line and text heavy figures and high-resolution PNG or TIFF for journal upload requirements.

## Preferred Package Strategy

- Base grammar: `ggplot2`, `scales`, `forcats`, `patchwork`, `cowplot`
- Publication helpers: `ggpubr`, `ggprism`, `ggsci`
- Clinical statistics: `survminer`, `rms`, `pROC`, `timeROC`, `forestmodel`
- Omics and systems biology: `ComplexHeatmap`, `clusterProfiler`, `enrichplot`, `EnhancedVolcano`
- Single-cell: `Seurat`

When several packages can solve the same task, prefer the smallest stack that keeps the code maintainable. Avoid mixing multiple high-level wrappers unless there is a concrete gain in annotation or layout control.

## Styling Modes

### Nature-like

- Use clean sans-serif text, thin axis lines, moderate whitespace, and restrained accent color.
- Keep backgrounds white and avoid heavy borders or saturated fills.
- Use colorblind-aware palettes and make every panel readable when printed small.
- Good defaults: `theme_classic()` or a stripped-down custom theme, `ggsci::scale_color_npg()`, patchwork for multi-panel balance.

### Cell-like

This style should be treated as an inference from common Cell-family figure aesthetics rather than an official Cell recipe.

- Favor compact multi-panel storytelling with consistent typography.
- Use neutral scaffolding colors and let one or two accent colors carry the message.
- Prefer direct labels or concise legends, tight panel alignment, and strong contrast in heatmaps or embeddings.
- Good defaults: minimal theme base, aligned panels through `patchwork` or `cowplot`, restrained palette with one highlight color.

### Clinical-clear

- Optimize for interpretability over visual novelty.
- Keep confidence intervals visible, use explicit group labels, and annotate statistics sparingly.
- For KM and ROC figures, prioritize line separation, readable censor marks, and uncluttered legends.
- For forest plots and nomograms, use left-aligned labels, generous row spacing, and conservative color.

## Output Rules

- Default manuscript font sizes: roughly 7 to 9 pt after final sizing.
- Keep line widths consistent across panels.
- Avoid rainbow palettes unless the figure encodes ordered continuous values and no better palette fits.
- Use the same semantic color mapping across all related figures in one project.
- Export code should set width, height, units, and dpi explicitly.
- If the user names a journal style, adapt to that style while preserving readability and journal submission constraints.

## Bundled Resources

- [medical-figure-landscape.md](references/medical-figure-landscape.md): common medical figure families and recommended R packages
- [journal-style-guide.md](references/journal-style-guide.md): Nature-like, Cell-like, and clinical styling heuristics
- [sources.md](references/sources.md): official package and journal-guide links used for this skill
- [medical_plot_helpers.R](scripts/medical_plot_helpers.R): reusable theme, palette, and export helpers

## Response Pattern

When you answer with code:

- Briefly state the figure family and chosen package stack.
- Explain the styling intent in one or two sentences.
- Return runnable R code with explicit library calls.
- Include export code.
- If a requested style is only approximate, say that clearly and describe what was inferred.
