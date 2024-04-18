.onLoad <- function(libname, pkgname) {
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
