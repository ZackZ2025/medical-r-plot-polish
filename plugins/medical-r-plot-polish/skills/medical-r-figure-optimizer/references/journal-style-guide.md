# Journal Style Guide

Use this file when the user asks for a named style or for a publication-ready finish.

## Nature-like

Official Nature guidance emphasizes legibility, accessible color use, and figure clarity. In practice, that usually means:

- Sans-serif fonts with small but readable final print size
- Colorblind-accessible choices
- Minimal non-data ink
- Tight control of panel labels, spacing, and export resolution

Recommended R implementation:

- Base theme: `theme_classic()` or a light custom theme
- Palette: `ggsci::scale_color_npg()` or manually chosen colorblind-safe palette
- Layout: `patchwork` with consistent tag placement and aligned legends
- Export: PDF for editable vector workflows, PNG or TIFF at journal-required dpi for submission

## Cell-like

No single official R style exists for Cell-family figures, so this mode is an inference from common Cell-style presentation patterns:

- Story-driven multipanel layouts
- One strong focal accent color with restrained supporting colors
- Clean sans-serif typography
- Dense but orderly compositions for mechanistic or multi-omics narratives

Recommended R implementation:

- Base theme: custom minimal theme with slightly tighter spacing than Nature-like
- Palette: one highlight color plus grayscale or muted companions
- Layout: `cowplot::plot_grid()` or `patchwork` with strong alignment
- Annotation: direct labels for the most important series, legends trimmed aggressively

## Clinical-clear

Use this when the audience is clinicians, trial reviewers, or collaborators who need rapid interpretation.

- Prefer explicit labels over stylized abbreviations
- Keep confidence intervals, reference lines, and clinically relevant thresholds visible
- Avoid decorative gradients and unnecessary panel nesting
- Use stable, conservative colors across endpoints

Recommended R implementation:

- Base theme: `theme_bw()` simplified or a custom clean theme
- Palette: restrained blue, red, green, or grayscale combinations with high contrast
- Annotation: p-values, hazard ratios, or AUC kept compact and close to the data

## Export Checklist

- Set figure dimensions explicitly.
- Use `ggsave()` with fixed width, height, units, and dpi.
- Check that all text remains readable when the figure is scaled to manuscript width.
- Verify that color differences remain distinguishable in grayscale if the figure may be printed.
- For multi-panel figures, ensure panel tags and legends stay aligned after export.

## Reusable Defaults

- Base font size: start around 8 or 9 for manuscript figures
- Axis title size: base plus 0.5 to 1
- Legend title: keep short or omit when obvious
- Line width: keep consistent within a figure family
- Point alpha: reduce slightly for dense scatter or embedding plots
