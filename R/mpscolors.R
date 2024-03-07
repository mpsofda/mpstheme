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

# Function to extract mps_colors as hex codes
# @param ... Character names of mps_colors
mps_cols <- function(...)  {
  cols <- c(...)

  if (is.null(cols))
    return (mps_colors)

  mps_colors[cols]
}


## Define MPS color palettes
# Changes or additions to color palettes should be done here
mps_palettes <- list(
  `primary`   = mps_cols("yellow", "blue", "red"),
  `secondary` = mps_cols("teal", "orange", "wine", "green", "dblue", "purple"),
  `dark`      = mps_cols("yellow", "blue", "red", "teal", "orange", "wine",
                         "green", "dblue", "purple"),
  `light`     = mps_cols("light yellow", "light blue", "light red",
                         "light teal", "light orange", "light wine",
                         "light green", "light dblue", "elight wine"),
  `hot`      = mps_cols("red", "orange", "yellow"),
  `warm`     = mps_cols("light red", "light orange", "light yellow"),
  `cold`     = mps_cols("dblue", "blue", "teal", "green"),
  `cool`     = mps_cols("light dblue", "light blue", "light teal", "light green"),
  `purples`  = mps_cols("wine", "purple", "light wine", "elight wine")
)
