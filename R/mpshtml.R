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
#' #'
#' @return A HTML span color function
#' @export
mps_tcolor_html <- function(color, text) {
    paste0("<span style='color: ", mps_cols(color), "'>",text,"</span>")
}

#' Callout Boxes, for HTML docs
#'
#' @param text Whatever text you want included inside the callout box
#' @param type Type of callout box. Available choices are note, warning, important, and special.
#' @param title Only used when type = "special". This will create a custom title for the callout box.
#'
#' @return An HTML div function
#' @export
mps_callout_html <- function(text, type = "note", title = NULL) {
  if (type == "note") {
    div(
      span("NOTE", style = "font-variant: small-caps; font-weight: 650; color: #5261AC"),
      br(),
      span(text, style = "color: #000000"),
      class = "warning", style = "background-color: #f5f6fa; color: #5261AC; border-left: solid #5261AC 4px; border-radius: 6px; padding: 0.7em"
    )
  } else if (type == "important") {
    div(
      span("IMPORTANT", style = "font-variant: small-caps; font-weight: 650; color: #F57A21"),
      br(),
      span(text, style = "color: #000000"),
      class = "warning", style = "background-color: #fef7f2; color: #F57A21; border-left: solid #F57A21 4px; border-radius: 6px; padding: 0.7em"
    )
  } else if (type == "warning") {
    div(
      span("WARNING", style = "font-variant: small-caps; font-weight: 650; color: #BA3326"),
      br(),
      span(text, style = "color: #000000"),
      class = "warning", style = "background-color: #fbf3f2; color: #BA3326; border-left: solid #BA3326 4px; border-radius: 6px; padding: 0.7em"
    )
  } else if (type == "special" & !is.null(title)) {
    div(
      span(title, style = "font-variant: small-caps; font-weight: 650; color: #591F63"),
      br(),
      span(text, style = "color: #000000"),
      class = "warning", style = "background-color: #f5f2f6; color: #591F63; border-left: solid #591F63 4px; border-radius: 6px; padding: 0.7em"
    )
  } else if (type == "special" & is.null(title)) {
    paste0("ERROR: When using a special callout, argument title cannot be NULL.")
  } else {
    paste0("ERROR: Please choose a type from 'note', 'warning', 'important', and 'special'.")
  }
}
