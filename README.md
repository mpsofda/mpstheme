# MPS Theme Package

This package includes additional `R`, `LaTeX`, and `R Markdown` functions, commands, and templates to allow for the easy creation of MPS-themed plots, tables, charts, graphs, and reports. Please see the R Markdown template **MPS Reports PDF Demo** for a demo of all the new functions and features included in this package. 

## First Time Installation and Use
### Dependent Packages
This package relies on several other packages to function. While the installation of the package itself should also install most of the needed packages and load the needed functions, you can make sure everything runs smoothly by being sure you have the latest versions of the following packages **before** installing the `mpstheme` package: `devtools` [for installing from github], `extrafont`, `ggplot2`, `ggfun`, `grDevices`, `showtext`, `sysfonts`, and `tinytex` [for handling `.pdf` outputs]. An easy way to check whether you have these packages installed, and install them if you don't, is to run the following code in your `R` console:

```r
####  Setup dependencies  ####
# Identify needed packages
packages <- c(`devtools`, `ggplot2`, `ggfun`, `grDevices`, `showtext`, `sysfonts`, `tinytex`)

# Install packages if not installed
install.packages(setdiff(packages, rownames(installed.packages())))
```

### Dependency Setup

Once those packages are installed, there are a few more commands to run to make sure things run smoothly from the get-go:

```r
####  Setup for LaTeX distribution  ####
# Load tinytex
require(tinytex)

# Install the tinyTeX distribution
install_tinytex()

# Then install the necessary LaTeX packages from CTAN
# NOTE: This function will auto execute the first time you run one of the new R Markdown templates.
#       It is included here so there are no delays when knitting a document the first time.
tlmgr_install(
    pkgs = c(
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
```
### Install the Package

Once the above is taken care of, go ahead and install the package from GitHub:

```r
####  Install mpstheme Package from GitHub  ####
# Load devtools
require(devtools)

# Install package
install_github("mpsofda/mpstheme")
```

