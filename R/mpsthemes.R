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
#' @param ... Other arguments to be passed to theme()
#'
#' @export
#'
theme_mps <- function(pri.color = mps_cols("wine"),
                       sec.color = mps_cols("light wine"),
                       ter.color = "gray40",
                       ...) {
  theme(
    # Set all text-based elements of the theme
    # Base text definition
    text = element_text(size = 14, color = pri.color, family = "Poppins"),
    # Plot titles, subtitles, and captions
    plot.title = element_text(hjust = 0.5),
    plot.title.position = "panel",
    plot.subtitle = element_text(size = 11, hjust = 0.5),
    plot.caption = element_text(size = 9, face = "italic", color = ter.color, hjust = 1),
    plot.caption.position = "plot",
    # Axis titles and text
    axis.title = element_text(size = 11),
    axis.text = element_text(size = 9, face = "italic", color = ter.color),
    axis.title.y = element_text(margin = margin(r = 10), color = sec.color, angle = 90),
    axis.title.x = element_text(margin = margin(t = 10), color = sec.color),
    # Legend titles, text, and formatting
    legend.title = element_text(size = 11, color = sec.color),
    legend.text = element_text(size = 9, color = ter.color),
    # Plot aesthetics
    plot.background = element_roundrect(color = pri.color, size = 1, r = .05),
    plot.margin = margin(.125, .125, .125, .125, unit = "inches"),
    # Panel aesthetics
    panel.background = element_rect(fill = "white"),
    panel.border = element_roundrect(fill = NA, color = ter.color, r = .03),
    panel.grid = element_line(color = "gray93", linewidth = 0.5, linetype = 1),
    panel.grid.minor = element_blank(),
    # Legend aesthetics
    legend.key = element_rect(fill = "white"),
    # Facet aesthetics
    strip.background = element_roundrect(fill = pri.color, color = pri.color, r = .125),
    strip.text = element_text(size = 9, face = "italic", color = "white"),
    ...
  )
}

#' MPS Theme for ggplot2 donut plots - for OFDA department
#'
#' @description
#' Basic theme for MPS graphs. Based on Fiona Adams' excellent School Transformation Theme.
#' Primary, Secondary, and Tertiary colors can be chosen from any color palette, or from mps_cols().
#'
#'
#' @param pri.color Primary color of the theme. Impacts title, subtitle, legend title, and facet panels.
#' @param sec.color Secondary color of the theme. Impacts axis titles and legend title.
#' @param ter.color Tertiary color of the theme. Impacts axis labels, captions, and legend text.
#' @param ... Other arguments to be passed to theme()
#'
#' @export
#'
theme_mps_donut <- function(pri.color = mps_cols("wine"),
                       sec.color = mps_cols("light wine"),
                       ter.color = "gray40",
                       ...) {
  theme(
    # Set all text-based elements of the theme
    # Base text definition
    text = element_text(size = 14, color = pri.color, family = "Poppins"),
    # Plot titles, subtitles, and captions
    plot.title = element_text(hjust = 0.5),
    plot.title.position = "panel",
    plot.subtitle = element_text(size = 11, hjust = 0.5),
    plot.caption = element_text(size = 9, face = "italic", color = ter.color, hjust = 1),
    plot.caption.position = "plot",
    # Axis titles and text
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.line = element_blank(),
    axis.ticks = element_blank(),
    # Legend titles, text, and formatting
    legend.title = element_text(size = 11, color = sec.color),
    legend.text = element_text(size = 9, color = ter.color),
    legend.position = "bottom",
    # Plot aesthetics
    plot.background = element_roundrect(color = pri.color, size = 1, r = .05),
    plot.margin = margin(.125, 1, .125, 1, unit = "inches"),
    # Panel aesthetics
    panel.background = element_rect(fill = "white"),
    panel.border = element_blank(),
    panel.grid = element_blank(),
    panel.grid.minor = element_blank(),
    # Legend aesthetics
    legend.key = element_rect(fill = "white"),
    # Facet aesthetics
    strip.background = element_rect(fill = pri.color, color = pri.color),
    strip.text = element_text(size = 9, face = "italic", color = "white"),
    ...
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
title_mps <- function(title = "Some Title", color = mps_cols("wine")) {
  ggplot() +
    geom_blank() +
    labs(title = title) +
    theme(
      # Specific text definitions
      plot.title = element_text(size = 22.5, family = "Poppins", face = "bold", hjust = 0.5, colour = "white"),
      # Plot aesthetics
      plot.background = element_roundrect(fill = color, color = color, r = .5),
      plot.margin = margin(.125, .125, .125, .125, unit = "inches"),
      # Panel aesthetics
      panel.background = element_blank(),
      complete = TRUE
    )
}


#' Force load the MPS Fonts if package doesn't automatically load them
#'
#' @description
#' A function to force load the Google Poppins font if not automatically loaded by require(mpstheme)
#'
#' @export
#'
mps_fonts <- function() {
  font_add(
    family = "PoppinsSB",
    regular = system.file("font/Poppins-SemiBold.ttf", package = "mpstheme"),
    bold = system.file("font/Poppins-ExtraBold.ttf", package = "mpstheme"),
    italic = system.file("font/Poppins-SemiBoldItalic.ttf", package = "mpstheme"),
    bolditalic = system.file("font/Poppins-ExtraBoldItalic.ttf", package = "mpstheme")
  )
  font_add(
    family = "Poppins",
    regular = system.file("font/Poppins-Regular.ttf", package = "mpstheme"),
    bold = system.file("font/Poppins-SemiBold.ttf", package = "mpstheme"),
    italic = system.file("font/Poppins-Italic.ttf", package = "mpstheme"),
    bolditalic = system.file("font/Poppins-SemiBoldItalic.ttf", package = "mpstheme")
  )
}

### New geom_label_mps function
## Create new geom label ggproto object
NewGeomLabel <- ggproto(
  "NewGeomLabel",
  GeomLabel,
  default_aes = aes(
    color = "black",
    fill = 'white',
    size = 4,
    angle = 0,
    hjust = 0.5,
    vjust = 0.5,
    alpha = NA,
    fontface = 'bold',
    label.size = 1,
    label.r = unit(2.5,'pt')
  )
)

#' MPS Standardized labeling function
#'
#' @param mapping A mapping aesthetic, assigned with aes()
#' @param data What data is being used? Inherited from initial ggplot() call
#' @param stat Default stat
#' @param position Default position
#' @param na.rm Whether to remove NA values from the labels. Default is FALSE.
#' @param show.legend Whether to show the legend from the labels. Default is FALSE
#' @param inherit.aes Whether to inherit aes from initial ggplot() call. Default is TRUE
#' @param ... Other parameters to be passed to ggplot layer
#' @param vjust Default vertical justification
#' @param fill Default label background color
#' @param size Default text size
#' @param fontface Default face
#' @param label.size Default size of label
#' @param label.r Default size of label corner radius
#'
#' @export
geom_label_mps <- function(
    mapping = NULL,
    data = NULL,
    stat = "identity",
    position = "identity",
    na.rm = FALSE,
    show.legend = FALSE,
    inherit.aes = TRUE,
    ...,
    vjust = 0.5,
    fill = 'white',
    size = 4,
    fontface = 'bold',
    label.size = 1,
    label.r = unit(2.5,'pt')) {
  layer(
    geom = NewGeomLabel,
    data = data,
    mapping = mapping,
    stat = stat,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(na.rm = na.rm,
                  vjust = vjust,
                  fill = fill,
                  size = size,
                  fontface = fontface,
                  label.size = label.size,
                  label.r = label.r,
                  ...)
  )
}
