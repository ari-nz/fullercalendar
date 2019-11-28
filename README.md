
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fullercalendar <img src='man/figures/logo.svg' align="right" height="139" />

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/ari-nz/fullercalendar.svg?branch=master)](https://travis-ci.org/ari-nz/fullercalendar)
[![Codecov test
coverage](https://codecov.io/gh/ari-nz/fullercalendar/branch/master/graph/badge.svg)](https://codecov.io/gh/ari-nz/fullercalendar?branch=master)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

The goal of fullercalendar is to …

## Installation

You cannot yet install the released version of fullercalendar from
[CRAN](https://CRAN.R-project.org), but when you can you can do so with:

``` r
install.packages("fullercalendar")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ari-nz/fullercalendar")
```

## Example

``` r
library(fullercalendar)
```

``` r
now = Sys.time()
today = Sys.Date()
events = data.frame(title = paste("Event", 1:4),
                 start  = c(isodate(today+(-1:1)), isotime(now)),
                 end    = c(isodate(today+(0:2) ), isotime(now + 4800)),
                 color  = c("red", "#3788d8", "green", "blue"))

head(events)
#>     title                    start                      end   color
#> 1 Event 1               2019-11-27               2019-11-28     red
#> 2 Event 2               2019-11-28               2019-11-29 #3788d8
#> 3 Event 3               2019-11-29               2019-11-30   green
#> 4 Event 4 2019-11-28T19:09:53+1300 2019-11-28T20:29:53+1300    blue
```

![man/figures/README-display-1.png](man/figures/README-display-1.png)

## Shiny Example

``` r
library(shiny)
library(fullercalendar)

ui <- fluidPage(
  fullercalendarOutput('mycal'),
)

server <- function(input, output, session) {
  output$mycal = renderFullercalendar({
    fc = fullercalendar(events)
    fc
  })
}

shinyApp(ui, server)
```
