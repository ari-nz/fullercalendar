#' Create a fullcalendar visualisation
#'
#' Uses Fullcalendar.js
#'
#' @seealso \href{https://fullcalendar.io/}{https://fullcalendar.io/}
#'
#' @param events A list of events, or a URL containing JSON data
#' @param settings settings to pass to the fullcalendar on initialisation
#' @param width Numeric table width
#' @param height Numeric table height
#' @param elementId HTML element ID if needed.
#' @param ... Other arguments (not currently utilised)
#'
#' @import htmlwidgets
#' @examples
#' \donttest{
#' fullercalendar()
#' }
#' @export
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

  message('full_opts - ', Sys.time())
  print(full_opts)

  # create widget
  htmlwidgets::createWidget(
    name = 'fullercalendar',
    x = full_opts,
    width = width,
    height = height,
    package = 'fullercalendar',
    elementId = elementId
  )
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
fullercalendarOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'fullercalendar', width, height, package = 'fullercalendar')
}







#' @rdname fullercalendar-shiny
#' @export
renderFullercalendar <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, fullercalendarOutput, env, quoted = TRUE)
}
