
<!-- README.md is generated from README.Rmd. Please edit that file -->

# maplibregl

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/maplibregl)](https://CRAN.R-project.org/package=maplibregl)
[![R build
status](https://github.com/crazycapivara/maplibre-gl-r/workflows/R-CMD-check/badge.svg)](https://github.com/crazycapivara/maplibre-gl-r/actions)
<!-- badges: end -->

The goal of `maplibregl` is to provide R bindings to
[maplibre-gl-js](https://github.com/maplibre/maplibre-gl-js).

## Installation

You can install the released version of maplibregl from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("maplibregl")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("crazycapivara/maplibre-gl-r")
```

## Example

``` r
library(maplibregl)

map <- maplibregl(
  center = c(-73.9165, 40.7114),
  zoom = 10,
  pitch = 30
)

if (interactive()) map
```
