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
#' @param width Fixed width for widget (in css units). The default is NULL, which results in intelligent automatic sizing based on the widget's container.
#' @param height Fixed height for widget (in css units). The default is NULL, which results in intelligent automatic sizing based on the widget's container.
#' @param elementId Use an explicit element ID for the widget (rather than an automatically generated one). Useful if you have other JavaScript that needs to explicitly discover and interact with a specific widget instance.
#' @param ... Other options which can be set specifically, that are not specified here: https://fullcalendar.io/docs/dynamic-options. See details.
#' @param plugins List of plugins to use when initialising the calendar
#' @param defaultView A name of any of the available views, such as 'dayGridWeek', 'timeGridDay', 'listWeek'
#' @param defaultDate The initial date displayed when the calendar first loads. Date When not specified, this value defaults to the current date. This value can be anything that can parse into a Date, including an ISO8601 date string like "2014-02-01".
#'
#' @details
#' The page https://fullcalendar.io/docs#toc defines the many options available to modifying the calendar object. Currently, most non-method properties are implemented.
#'
#'
#'
#' @export
#' @examples
#' fullercalendar(events =  demoevents())
#'
#'\donttest{
#' fullercalendar(demoevents(),
#'                defaultView = "timeGridWeek",
#'                weekends = TRUE,
#'                hiddenDays= c(2, 6),
#'                slotDuration = '00:10:00',
#'                firstDay = 1,
#'                weekNumbers = TRUE,
#'                selectable = TRUE,
#'                selectMirror = TRUE,
#'                editable = TRUE,
#'                dropable = TRUE,
#'
#' )
#'}
#'
fullercalendar <- function(events = list()
                           , ...
                           , plugins = c( 'interaction', 'dayGrid', 'timeGrid' )
                           , width = NULL
                           , height = NULL
                           , elementId = NULL
                           , defaultView  = 'dayGridMonth'
                           , defaultDate = NULL
)  {
  settings = list(...)

  full_opts = list(
    events = events,
    plugins = plugins,
    settings = settings,
    defaultView =defaultView,
    defaultDate = defaultDate
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



#' Pipe operator
#'
#' See \code{magrittr::\link[magrittr]{\%>\%}} for details.
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL


