#' MPS Theme for ggplot2 - for OFDA department
#'
#' @description
#' Basic theme for MPS graphs. Based on Fiona Adams' excellent School Transformation Theme.
#' Primary, Secondary, and Tertiary colors can be chosen from any color palette, or from mps_cols().
#'
#'
#' @param pri.color Primary color of the theme. Impacts title, subtitle, legend title, and facet panels.
#' @param sec.color Secondary color of the theme. Impacts axis titles and legend title.
#' @param ter.color Tertiary color of the theme. Impacts axis labels, captions, and legend text.
#'
#' @export
#'
theme_ofda <- function(pri.color = mps_cols("wine"), sec.color = mps_cols("light wine"), ter.color = mps_cols("gray")) {
  theme(
    # Set all text-based elements of the theme
    # Base text definition
    text = element_text(size = 20, color = pri.color, family = "Segoe UI Semibold"),
    # Specific text definitions
    plot.title = element_text(face = "bold", hjust = 0.5),
    plot.subtitle = element_text(size = 14, hjust = 0.5),
    plot.caption = element_text(size = 10, family = "Segoe UI", face = "italic", color = ter.color),
    plot.caption.position = "plot",
    axis.title = element_text(size = 16),
    axis.text = element_text(size = 12, face = "italic", color = ter.color),
    axis.title.y = element_text(margin = margin(r = 10), color = sec.color),
    axis.title.x = element_text(margin = margin(t = 10), color = sec.color),
    legend.title = element_text(size = 14, color = sec.color),
    legend.text = element_text(size = 12, color = ter.color),
    # Plot aesthetics
    plot.background = element_rect(color = pri.color, linewidth = 2),
    plot.margin = margin(.25, .25, .25, .25, unit = "inches"),
    # Panel aesthetics
    panel.background = element_rect(fill = "white"),
    panel.border = element_rect(fill = NA, color = ter.color),
    panel.grid = element_line(color = "gray97", linewidth = 0.5, linetype = 1),
    panel.grid.minor = element_blank(),
    # Legend aesthetics
    legend.key = element_rect(fill = "white"),
    # Facet aesthetics
    strip.background = element_rect(fill = pri.color, color = pri.color),
    strip.text = element_text(size = 10, face = "bold.italic", color = "white")
  )
}


#' MPS Report Title - for OFDA department
#'
#' @description
#' Function to insert MPS-styled report titles.
#'
#'
#' @param color Background color of the title box.
#' @param title The report title.
#'
#' @export
#'
title_ofda <- function(title = "Some Title", color = mps_cols("wine")) {
  ggplot() +
    geom_blank() +
    labs(title = title) +
    theme(
      # Specific text definitions
      plot.title = element_text(size = 22.5, family = "Segoe UI Semibold", face = "bold", hjust = 0.5, colour = "white"),
      # Plot aesthetics
      plot.background = element_rect(fill = color, color = color),
      plot.margin = margin(.25, .125, .125, .125, unit = "inches"),
      # Panel aesthetics
      panel.background = element_blank()
    )
}


#' MPS Theme for ggplot2 - for REA department
#'
#' @description
#' Basic theme for MPS graphs. Based on Fiona Adams' excellent School Transformation Theme.
#' Primary, Secondary, and Tertiary colors can be chosen from any color palette, or from mps_cols().
#'
#'
#' @param pri.color Primary color of the theme. Impacts title, subtitle, legend title, and facet panels.
#' @param sec.color Secondary color of the theme. Impacts axis titles.
#' @param ter.color Tertiary color of the theme. Impacts axis labels, captions, and legend text.
#'
#' @export
#'
theme_rea <- function(pri.color = mps_cols("red"), sec.color = mps_cols("light red"), ter.color = mps_cols("gray")) {
  theme(
    # Set all text-based elements of the theme
    # Base text definition
    text = element_text(size = 22, color = pri.color, family = "Segoe UI Semibold"),
    # Specific text definitions
    plot.title = element_text(face = "bold", hjust = 0.5),
    plot.subtitle = element_text(size = 14, hjust = 0.5),
    plot.caption = element_text(size = 12, family = "Segoe UI", face = "italic", color = ter.color),
    plot.caption.position = "plot",
    axis.title = element_text(size = 16),
    axis.text = element_text(size = 12, face = "italic", color = ter.color),
    axis.title.y = element_text(margin = margin(r = 10), color = sec.color),
    axis.title.x = element_text(margin = margin(t = 10), color = sec.color),
    legend.title = element_text(size = 14, color = sec.color),
    legend.text = element_text(size = 12, color = ter.color),
    # Plot aesthetics
    plot.background = element_rect(color = pri.color, linewidth = 2),
    plot.margin = margin(.25, .25, .25, .25, unit = "inches"),
    # Panel aesthetics
    panel.background = element_rect(fill = "white"),
    panel.border = element_rect(fill = NA, color = ter.color),
    panel.grid = element_line(color = "gray97", linewidth = 0.5, linetype = 1),
    panel.grid.minor = element_blank(),
    # Legend aesthetics
    legend.key = element_rect(fill = "white"),
    # Facet aesthetics
    strip.background = element_rect(fill = pri.color, color = pri.color),
    strip.text = element_text(size = 10, face = "bold.italic", color = "white")
  )
}

#' MPS Report Title - for REA department
#'
#' @description
#' Function to insert MPS-styled report titles.
#'
#'
#' @param color Background color of the title box.
#' @param title The report title.
#'
#' @export
#'
title_rea <- function(title = "Some Title", color = mps_cols("red")) {
  ggplot() +
    geom_blank() +
    labs(title = title) +
    theme(
      # Specific text definitions
      plot.title = element_text(size = 22.5, family = "Segoe UI Semibold", face = "bold", hjust = 0.5, colour = "white"),
      # Plot aesthetics
      plot.background = element_rect(fill = color, color = color),
      plot.margin = margin(.25, .125, .125, .125, unit = "inches"),
      # Panel aesthetics
      panel.background = element_blank()
    )
}
