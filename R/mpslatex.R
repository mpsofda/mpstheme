##### Plots, Tables, and Figures #####

# Simple incremental function to create new function...
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
plotcount <- increment(0)
tablecount <- increment(0)
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

#' Callout Boxes, for PDFs
#'
#' @param text Whatever text you want included inside the callout box
#' @param type Type of callout box. Available choices are note, warning, important, and special.
#' @param title Only used when type = "special". This will create a custom title for the callout box.
#'
#' @return A LaTeX special color box function
#' @export
mps_callout <- function(text, type = "note", title = NULL) {
  if (type == "note") {
    paste0("\\notebox{", text, "}")
  } else if (type == "warning") {
    paste0("\\warnbox{", text, "}")
  } else if (type == "important") {
    paste0("\\impbox{", text, "}")
  } else if (type == "special" & !is.null(title)) {
    paste0("\\specbox{", title, "}{", text, "}")
  } else if (type == "special" & is.null(title)) {
    paste0("ERROR: When using a special callout, argument title cannot be NULL.")
  } else {
    paste0("ERROR: Please choose a type from 'note', 'warning', 'important', and 'special'.")
  }
}

