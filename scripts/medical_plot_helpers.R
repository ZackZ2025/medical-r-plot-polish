suppressPackageStartupMessages({
  library(ggplot2)
})

# Minimal publication theme for medical plots.
theme_medical_pub <- function(base_size = 8, base_family = "Arial") {
  theme_classic(base_size = base_size, base_family = base_family) +
    theme(
      axis.line = element_line(linewidth = 0.4, colour = "black"),
      axis.ticks = element_line(linewidth = 0.35, colour = "black"),
      axis.title = element_text(face = "plain", colour = "black"),
      axis.text = element_text(colour = "black"),
      legend.position = "right",
      legend.title = element_text(size = base_size),
      legend.text = element_text(size = base_size - 0.2),
      plot.title = element_text(face = "bold", size = base_size + 1),
      plot.subtitle = element_text(size = base_size),
      strip.background = element_blank(),
      strip.text = element_text(face = "bold"),
      panel.border = element_blank()
    )
}

# Nature-like palette using ggsci when available.
scale_colour_nature_like <- function(...) {
  if (requireNamespace("ggsci", quietly = TRUE)) {
    return(ggsci::scale_colour_npg(...))
  }
  scale_colour_manual(values = c("#3C5488", "#00A087", "#E64B35", "#4DBBD5", "#F39B7F"), ...)
}

scale_fill_nature_like <- function(...) {
  if (requireNamespace("ggsci", quietly = TRUE)) {
    return(ggsci::scale_fill_npg(...))
  }
  scale_fill_manual(values = c("#3C5488", "#00A087", "#E64B35", "#4DBBD5", "#F39B7F"), ...)
}

# Cell-like styling is an approximation built for compact multi-panel figures.
theme_cell_like <- function(base_size = 8, base_family = "Arial") {
  theme_minimal(base_size = base_size, base_family = base_family) +
    theme(
      panel.grid.major = element_line(linewidth = 0.2, colour = "#E5E5E5"),
      panel.grid.minor = element_blank(),
      axis.line = element_line(linewidth = 0.35, colour = "black"),
      axis.ticks = element_line(linewidth = 0.3, colour = "black"),
      axis.title = element_text(face = "plain", colour = "black"),
      axis.text = element_text(colour = "black"),
      legend.position = "right",
      strip.text = element_text(face = "bold"),
      plot.title = element_text(face = "bold", size = base_size + 1)
    )
}

medical_palette <- function() {
  c(
    control = "#3C5488",
    treatment = "#E64B35",
    secondary = "#00A087",
    neutral = "#7E6148",
    light = "#91D1C2"
  )
}

save_journal_figure <- function(plot, filename, width = 180, height = 120, dpi = 300) {
  ggsave(
    filename = filename,
    plot = plot,
    width = width,
    height = height,
    units = "mm",
    dpi = dpi,
    bg = "white"
  )
}
