#' Display a FullCalendar widget
#'
#' This function creates a FullCalendar htmlwidget that will show up
#' in the viewer pane, if you're running RStudio, or in your Rmarkdown
#' document.
#'
#' @param events a data frame with one row per event where the columns needs
#'   to follow the naming conventions by FullCalendar shown here: https://fullcalendar.io/docs/event-object.
#'   This data frame will then be translated into a json array by means of \code{jsonlite::toJSON}. The required
#'   columns are \code{title}, a string, and \code{start} as string parse-able as a date, for example, "2017-02-28".
#' @param settings A list of settings for the FullCalendar.
#'   See here for the available settings: https://fullcalendar.io/docs/display/ .
#' @param width Fixed width for widget (in css units). The default is NULL, which results in intelligent automatic sizing based on the widget's container.
#' @param height Fixed height for widget (in css units). The default is NULL, which results in intelligent automatic sizing based on the widget's container.
#' @param elementId Use an explicit element ID for the widget (rather than an automatically generated one). Useful if you have other JavaScript that needs to explicitly discover and interact with a specific widget instance.
#'
#' @export
#' @examples
#' now = Sys.time()
#' today = Sys.Date()
#' events = data.frame(title = paste("Event", 1:4),
#'                   start  = c(isodate(today+(-1:1)), isotime(now)),
#'                   end    = c(isodate(today+(0:2) ), isotime(now + 4800)),
#'                   color  = c("red", "#3788d8", "green", "blue"))
#' fullercalendar(events =  events)
#'
#'
fullercalendar <- function(events = NULL,
                           settings = list(),
                           width = NULL,
                           height = NULL,
                           elementId = NULL) {

  full_opts = list(
    events = events,
    settings = settings
  )

  attr(full_opts, 'TOJSON_ARGS') <- list(dataframe = "rows")


  # create widget
  fc = htmlwidgets::createWidget(
    name = 'fullercalendar',
    x = full_opts,
    width = width,
    height = height,
    package = 'fullercalendar',
    elementId = elementId
  )

  fc

}

#' Shiny bindings for fullercalendar
#'
#' Output and render functions for using fullercalendar within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a fullercalendar
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name fullercalendar-shiny
#'
#' @export
fullercalendarOutput <- function(outputId, width = '100%', height = '100%'){
  htmlwidgets::shinyWidgetOutput(outputId, 'fullercalendar', width, height, package = 'fullercalendar')
}

#' @rdname fullercalendar-shiny
#' @export
renderFullercalendar <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, fullercalendarOutput, env, quoted = TRUE)
}
