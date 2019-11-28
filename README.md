
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
events = demoevents()
head(events)
#>     title                    start                      end   color
#> 1 Event 0               2019-11-27               2019-11-28     red
#> 2 Event 1               2019-11-28               2019-11-29 #3788d8
#> 3 Event 2               2019-11-29               2019-11-30   green
#> 4 Event 3 2019-11-28T22:20:00+1300 2019-11-28T23:40:00+1300    blue
```

![man/figures/README-display-1.png](man/figures/README-display-1.png)

## Shiny Example

``` r
library(shiny)
library(fullercalendar)

set.seed(42)

events = randomevents()

ui <- fluidPage(
  fullercalendarOutput('calendar')
)

server <- function(input, output, session) {
  output$calendar = renderFullercalendar({
    fc = fullercalendar(events, defaultView = 'timeGridWeek')
    fc
  })
}

shinyApp(ui, server)
```
