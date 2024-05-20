# MPS Theme Package

This package includes additional `R`, `LaTeX`, and `R Markdown` functions, commands, and templates to allow for the easy creation of MPS-themed plots, tables, charts, graphs, and reports. Please see the R Markdown template **MPS Reports PDF Demo** for a demo of all the new functions and features included in this package. 

## First Time Installation
### Dependent Packages
This package relies on several other packages to function. While the installation of the package itself should also install most of the needed packages and load the needed functions, you can make sure everything runs smoothly by being sure you have the latest versions of the following packages **before** installing the `mpstheme` package: `devtools` [for installing from github], `extrafont`, `ggplot2`, `ggfun`, `grDevices`, `showtext`, `sysfonts`, and `tinytex` [for handling `.pdf` outputs]. An easy way to check whether you have these packages installed, and install them if you don't, is to run the following code in your `R` console:

```r
####  Setup dependencies  ####
# Identify needed packages
packages <- c("devtools", "extrafont", "extrafontdb",
              "ggplot2", "ggfun", "grDevices",
              "magick", "showtext", "sysfonts", "tinytex")

# Install packages if not installed
install.packages(setdiff(packages, rownames(installed.packages())))
```

### Dependency Setup

Once those packages are installed, there are a few more commands to run to make sure things run smoothly from the get-go:

```r
####  Setup for LaTeX distribution  ####
# Load tinytex
library(tinytex)

# Install the tinyTeX distribution
install_tinytex()

# Then install the necessary LaTeX packages from CTAN
# NOTE: This function will auto execute the first time you run one of the new R Markdown templates.
#       It is included here so there are no delays when knitting a document the first time.
tlmgr_install(
    pkgs = c(
      "booktabs",
      "colortbl",
      "fancyhdr",
      "fancyvrb",
      "fontspec",
      "framed",
      "fvextra",
      "listings",
      "paralist",
      "ragged2e",
      "sectsty",
      "tcolorbox",
      "titlesec",
      "xcolor"
    )
)

####  Install Poppins & Import Fonts  ####
# Load packages
library(sysfonts)     # For installing the MPS font
library(extrafont)   # For loading installed fonts into R
library(extrafontdb) # DB for registering installed fonts

# Install MPS font
font_add_google("Poppins")

## Register fonts with R
# Only needs to be done once
# This may take a while...
font_import()
```

### Install the Package

Once the above is taken care of, go ahead and install the package from GitHub:

```r
####  Install mpstheme Package from GitHub  ####
# Load devtools
library(devtools)

# Install package
install_github("mpsofda/mpstheme")
```

You may get notification that some of your other packages are out of date:
```r
> install_github("mpsofda/mpstheme")
Downloading GitHub repo mpsofda/mpstheme@HEAD
These packages have more recent versions available.
It is recommended to update all of them.
Which would you like to update?

 1: All                            
 2: CRAN packages only             
 3: None                           
 4: rlang   (1.1.2 -> 1.1.3) [CRAN]
{...}
```
You should update all packages.

## Using the Package

The `mpstheme` package comes with a number of new functions, all of which are documented. The documentation can be accessed via the R console after the package has been installed and loaded by typing `?` and the function name, such as `?title_mps`. The functions included in the package, and their use case, are included below for your reference. In the package is also a new R Markdown template which demonstrates all the new functionality in the package: `MPS Reports PDF DEMO`

```
### New Functions
## ggplot2 specific:
theme_mps()                   # Adds the MPS theme to a ggplot object
theme_mps_donut()             # Adds the MPS donut plot theme to a ggplot object
title_mps("title")            # Adds the title to an R Markdown document by creating a ggplot object
geom_label_mps(mapping, data) # Adds data labeling to a ggplot plot
mps_cols(color)               # For use with scale_*_manual() to select specific MPS colors
scale_color_mps(palette)      # Adds the requested palette to the color scale. See Figure 1
scale_fill_mps(palette)       # Adds the requested palette to the fill scale. See Figure 1


## R Markdown specific
# R Functions:
mps_caption(caption, type) # Adds the caption below a figure, table, or plot
mps_fonts()                # Loads the fonts if not autoloaded by require(mpstheme)
mps_tcolor(color, text)    # Change the color of text in an R Markdown doc

# LaTeX Functions
\notebox{content}          # Note box
\warnbox{content}          # Warning note box
\impbox{content}           # Important note box
\specbox{title}{content}   # Like previous boxes, but allows you to change box title.

# HTML Functions
mps_caption_html(caption, type)  # Adds the caption below a figure, table, or plot
mps_tcolor_html(color, text)     # Change the color of text in an R Markdown doc
```

In addition to these functions inside the R package and included R Markdown templates, there are a few additional functions you should be aware of:

```
## Ensure the fonts are registered and R knows where they are
# This allows ggplot to use the correct font with all devices and outputs modes
# This needs to be run every R session using fonts other than base R fonts
library(extrafont)
loadfonts(device = "all", quiet = TRUE)

## Showtext and the following showtext options are not strictly necessary,
#    but they do make the fonts smoother and more presentable.
library(showtext)

# Automatically enables showtext() for plots and figures
showtext_auto() 

#'*Use the below when knitting to pdf or html*
showtext_opts(dpi = 300)

#'*Use the below for inline viewing of plots*
# showtext_opts(dpi = 96)

```

## Future Development

We plan to develop the R Markdown templates to allow for both `HTML` and `.doc` outputs as well. That development won't begin for several weeks to months while we continue our work on higher priority projects. 
