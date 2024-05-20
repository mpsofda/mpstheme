##### Plots, Tables, and Figures #####

# Simple incremental function to create new function...
increment <- function(init) function() { init <<- init + 1; init }

#' Add a HTML caption below a table, plot, or figure.
#'
#' @description
#' Function adds a caption using HTML font styling and automatically counts up
#' from 1 for each time the caption function is called.
#'
#' @param caption Your caption
#' @param type One of "plots", "tables", and "figures"
#'
#' @export
mps_caption_html <- function(caption, type) {
  if (type == "plots") {
    paste0("<p style='color: #591f63; text-align: center; font-size: 1.3rem'>Plot ",plotcount(),". ",caption,"</p>")
  } else if (type == "tables") {
    paste0("<p style='color: #591f63; text-align: center; font-size: 1.3rem'>Table ",tablecount(),". ",caption,"</p>")
  } else if (type == "figures") {
    paste0("<p style='color: #591f63; text-align: center; font-size: 1.3rem'>Figure ",figurecount(),". ",caption,"</p>")
  } else {paste0("Please choose a type from 'plots', 'tables', and 'figures'.")}

}

#Assigning new count functions
plotcount <- increment(0)
tablecount <- increment(0)
figurecount <- increment(0)


##### Other Formatting #####
#' Change the font color of text in an R Markdown document HTML output
#'
#' @param color Color for the text. Available choices when mps = TRUE are:
#' yellow, blue, red, teal, orange, wine, green, purple, and gray.
#' @param text Whatever text you want to change the color of.
#' @param mps Boolean for whether you want the MPS official colors [TRUE], or one of the
#' default LaTeX colors [FALSE].
#'
#' @return A LaTeX textcolor function
#' @export
mps_tcolor_html <- function(color, text) {
    paste0("<span style='color: ", mps_cols(color), "'>",text,"</span>")
}
