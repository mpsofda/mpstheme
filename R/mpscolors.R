## Define MPS Official Colors
# Changes or additions to color swatches should be done here
mps_colors <- c(
  `yellow`       = "#fcb614",
  `blue`         = "#5261ac",
  `red`          = "#bf301a",
  `teal`         = "#009590",
  `orange`       = "#f47c20",
  `wine`         = "#850c71",
  `green`        = "#9fa617",
  `dblue`        = "#0067a3",
  `purple`       = "#5b4099",
  `gray`         = "#7f7f7f",
  `light gray`   = "#b4b7b7",
  `light yellow` = "#f1ce7d",
  `light blue`   = "#8c96c8",
  `light red`    = "#d47666",
  `light teal`   = "#66bfbb",
  `light orange` = "#f8af79",
  `light green`  = "#c5c973",
  `light dblue`  = "#66a2c8",
  `light wine`   = "#b56daf",
  `elight wine`  = "#eac1df"
)

#' Function for retrieving hex codes of MPS official colors.
#'
#' @param ... Character names of MPS colors. Valid options include: yellow, blue,
#' red, teal, orange, wine, green, dblue, purple, gray, light gray, light yellow,
#' light blue, light red, light teal, light orange, light green, light dblue,
#' light wine, elight wine.
#'
#' @return    A hex value for the MPS color
#' @export
#'
#' @examples
#' # Return the hex value of MPS Wine
#' mps_cols("wine")
#'
#' # Return the hex value of MPS red and MPS blue
#' mps_cols("red", "blue")
#'
mps_cols <- function(...)  {
  cols <- c(...)

  if (is.null(cols))
    return (mps_colors)

  mps_colors[cols]
}


## Define MPS color palettes
# Changes or additions to color palettes should be done here
mps_palettes <- list(
  `primary`   = mps_cols("red", "yellow", "blue"),
  `secondary` = mps_cols("orange", "green", "teal", "dblue", "purple", "wine"),
  `dark`      = mps_cols("red", "orange", "yellow", "green", "teal", "blue",
                         "dblue", "purple", "wine"),
  `light`     = mps_cols("light red", "light orange", "light yellow",
                         "light green", "light teal", "light blue",
                         "light dblue", "light wine", "elight wine"),
  `hot`      = mps_cols("red", "orange", "yellow"),
  `warm`     = mps_cols("light red", "light orange", "light yellow"),
  `cold`     = mps_cols("dblue", "blue", "teal", "green"),
  `cool`     = mps_cols("light dblue", "light blue", "light teal", "light green"),
  `purples`  = mps_cols("wine", "purple", "light wine", "elight wine")
)

#' Function to interpolate an MPS color palette
#'
#' @param palette  Character name of palette in mps_palettes.
#' @param reverse  Boolean to reverse the palette order
#' @param ...      Args to pass to colorRampPalette()
#'
mps_pal <- function(palette = "primary", reverse = FALSE, ...)  {
  pal <- mps_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal, ...)
}

#' Color Scale of MPS Colors for ggplot2
#'
#' @param palette     Character name of an MPS Palette. Valid options include:
#' primary, secondary, dark, light, hot, warm, cold, cool, purples.
#' @param discrete    Boolean for whether aesthetic is discrete. Default is TRUE.
#' @param reverse     Boolean for whether to reverse palette. Default is FALSE.
#' @param ...         Additional args passed to discrete_scale() or scale_color_gradientn()
#'
#' @export
#'
scale_color_mps <- function(palette = "primary", discrete = TRUE,
                            reverse = FALSE, ...) {
  pal <- mps_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("color", paste0("mps_", palette), palette = pal, ...)
  }

  else {
    scale_color_gradientn(colors = pal(256), ...)
  }
}


#' Fill scale of MPS colors for ggplot2
#'
#' @param palette     Character name of an MPS Palette. Valid options include:
#' primary, secondary, dark, light, hot, warm, cold, cool, purples.
#' @param discrete    Boolean for whether aesthetic is discrete. Default is TRUE.
#' @param reverse     Boolean for whether to reverse palette. Default is FALSE.
#' @param ...         Additional args passed to discrete_scale() or scale_color_gradientn()
#'
#' @export
#'
scale_fill_mps <- function(palette = "primary", discrete = TRUE,
                            reverse = FALSE, ...) {
  pal <- mps_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("mps_", palette), palette = pal, ...)
  }

  else {
    scale_color_gradientn(colors = pal(256), ...)
  }
}

