# MPS Theme Package

This package includes additional `R`, `LaTeX`, and `R Markdown` functions, commands, and templates to allow for the easy creation of MPS-themed plots, tables, charts, graphs, and reports. Please see the R Markdown template **MPS Reports PDF Demo** for a demo of all the new functions and features included in this package. 

## First Time Installation and Use
### Dependent Packages
This package relies on several other packages to function. While the installation of the package itself should also install most of the needed packages and load the needed functions, you can make sure everything runs smoothly by being sure you have the latest versions of the following packages **before** installing the `mpstheme` package: `devtools` [for installing from github], `extrafont`, `ggplot2`, `ggfun`, `grDevices`, `showtext`, `sysfonts`, and `tinytex` [for handling `.pdf` outputs]. An easy way to check whether you have these packages installed, and install them if you don't, is to run the following code in your `R` console:

```r
####  Setup dependencies  ####
# Identify needed packages
packages <- c("devtools", "ggplot2", "ggfun", "grDevices", "showtext", "sysfonts", "tinytex")

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
 5: glue    (1.6.2 -> 1.7.0) [CRAN]
 6: cli     (3.6.1 -> 3.6.2) [CRAN]
 7: vctrs   (0.6.4 -> 0.6.5) [CRAN]
 8: fansi   (1.0.5 -> 1.0.6) [CRAN]
 9: munsell (0.5.0 -> 0.5.1) [CRAN]
10: withr   (2.5.2 -> 3.0.0) [CRAN]
11: scales  (1.2.1 -> 1.3.0) [CRAN]
12: ggplot2 (3.4.4 -> 3.5.0) [CRAN]
```
You should update all packages.

## Future Development

We plan to develop the R Markdown templates to allow for both `HTML` and `.doc` outputs as well. That development won't begin for several weeks to months while we continue our work on higher priority projects. 
