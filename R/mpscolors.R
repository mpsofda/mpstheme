## Define MPS Official Colors
# Changes or additions to color swatches should be done here
mps_colors <- c(
  `yellow`       = "#fdb913",
  `blue`         = "#5261ac",
  `red`          = "#be3326",
  `wine`         = "#591f63",
  `orange`       = "#f57a21",
  `green`        = "#9ea617",
  `teal`         = "#009590",
  `gray`         = "#b2b2b2",

  `light yellow` = "#fed571",
  `light blue`   = "#97a0cd",
  `light red`    = "#d8857d",
  `light wine`   = "#9b79a1",
  `light orange` = "#f9af7a",
  `light green`  = "#c5ca74",
  `light teal`   = "#66bfbc",
  `light gray`   = "#c9c9c9",

  `dark yellow`  = "#b1820d",
  `dark blue`    = "#394478",
  `dark red`     = "#85241b",
  `dark wine`    = "#3e1645",
  `dark orange`  = "#ac5517",
  `dark green`   = "#6f7410",
  `dark teal`    = "#006865",
  `dark gray`    = "#7d7d7d"
)

#' Function for retrieving hex codes of MPS official colors.
#'
#' @description
#' This function allows the user to retrieve the hex code of official MPS colors
#' for use in any package function which can accept a hex code to change the color of some element.
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

  unname(mps_colors[cols])
}


## Define MPS color palettes
# Changes or additions to color palettes should be done here
mps_palettes <- list(
  `primary`   = mps_cols("red", "yellow", "blue"),
  `secondary` = mps_cols("orange", "green", "teal", "wine"),
  `standard`  = mps_cols("red", "orange", "yellow", "green", "teal",
                         "blue", "wine"),
  `dark`      = mps_cols("dark red", "dark orange", "dark yellow",
                         "dark green", "dark teal", "dark blue", "dark wine"),
  `light`     = mps_cols("light red", "light orange", "light yellow",
                         "light green", "light teal", "light blue", "light wine"),
  `hot`      = mps_cols("dark red", "dark orange", "dark yellow"),
  `warm`     = mps_cols("red", "orange", "yellow"),
  `mild`     = mps_cols("light red", "light orange", "light yellow"),
  `frigid`   = mps_cols("dark green", "dark teal", "dark blue", "dark wine"),
  `cold`     = mps_cols("green", "teal", "blue", "wine"),
  `cool`     = mps_cols("light green", "light teal", "light blue", "light wine"),
  `all`      = mps_cols(),
  `colorful` = mps_cols(
    "dark red", "red", "light red", "dark orange", "orange", "light orange",
    "dark yellow", "yellow", "light yellow", "dark green", "green", "light green",
    "dark teal", "teal", "light teal", "dark blue", "blue", "light blue",
    "dark wine", "wine", "light wine"
  )
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
#' @description
#' This function allows a user to set a color scale based on MPS colors.
#'
#'
#' @param palette     Character name of an MPS Palette. Valid options include:
#' primary, secondary, dark, light, hot, warm, cold, cool, purples.
#' @param discrete    Boolean for whether aesthetic is discrete. Default is TRUE.
#' @param reverse     Boolean for whether to reverse palette. Default is FALSE.
#' @param ...         Additional args passed to discrete_scale() or scale_color_gradientn()
#'
#' @export
#'
scale_color_mps <- function(palette = "standard", discrete = TRUE,
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
#' @description
#' This function allows a user to set a fill scale based on MPS colors.
#'
#' @param palette     Character name of an MPS Palette. Valid options include:
#' primary, secondary, dark, light, hot, warm, cold, cool, purples.
#' @param discrete    Boolean for whether aesthetic is discrete. Default is TRUE.
#' @param reverse     Boolean for whether to reverse palette. Default is FALSE.
#' @param ...         Additional args passed to discrete_scale() or scale_color_gradientn()
#'
#' @export
#'
scale_fill_mps <- function(palette = "standard", discrete = TRUE,
                            reverse = FALSE, ...) {
  pal <- mps_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("mps_", palette), palette = pal, ...)
  }

  else {
    scale_color_gradientn(colors = pal(256), ...)
  }
}

