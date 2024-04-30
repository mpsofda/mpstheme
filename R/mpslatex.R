##### Plots, Tables, and Figures #####

#' Simple incremental function to create new function...
#'
#' @description
#' Add to beginning of an .Rmd file if you're using a for loop to run the .Rmd
#' multiple times. Otherwise, there's no need to use this function.
#'
#' @param init Initial value, default should be 0
#'
#' @export
increment <- function(init) function() { init <<- init + 1; init }

#' Add a LaTeX caption below a table, plot, or figure.
#'
#' @description
#' Function adds a caption using LaTeX font styling and automatically counts up
#' from 1 for each time the caption function is called.
#'
#' @param caption Your caption
#' @param type One of "plots", "tables", and "figures"
#'
#' @export
mps_caption <- function(caption, type) {
  if (type == "plots") {
    paste0("\\pltcap{Plot ",plotcount(),". ",caption,"}")
  } else if (type == "tables") {
    paste0("\\pltcap{Table ",tablecount(),". ",caption,"}")
  } else if (type == "figures") {
    paste0("\\pltcap{Figure ",figurecount(),". ",caption,"}")
  } else {paste0("Please choose a type from 'plots', 'tables', and 'figures'.")}

}

#Assigning new count functions
#' @export
plotcount <- increment(0)

#Assigning new count functions
#' @export
tablecount <- increment(0)

#Assigning new count functions
#' @export
figurecount <- increment(0)


##### Other Formatting #####
#' Change the font color of text in an R Markdown document output
#'
#' @param color Color for the text. Available choices when mps = TRUE are:
#' yellow, blue, red, teal, orange, wine, green, darkblue, purple, and gray.
#' Available choices when mps = FALSE are: black, blue, brown, cyan, darkgray, gray,
#' green, lightgray, lime, magenta, olive, orange, pink, purple, red, teal,
#' violet, white, yellow.
#' @param text Whatever text you want to change the color of.
#' @param mps Boolean for whether you want the MPS official colors [TRUE], or one of the
#' default LaTeX colors [FALSE].
#'
#' @return A LaTeX textcolor function
#' @export
mps_tcolor <- function(color, text, mps = TRUE) {
  if (mps == TRUE) {
    color <- paste0("mps", color)
    paste0("\\textcolor{",color,"}{",text,"}")
  } else {
    paste0("\\textcolor{",color,"}{",text,"}")
  }
}
