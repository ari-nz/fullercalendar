.onLoad <- function(libname, pkgname) {


  # Unbox the events when droped.
  shiny::registerInputHandler("fc_events", function(data, ...) {
    jsonlite::fromJSON(data)
  })
}