.onLoad <- function(libname, pkgname) {


  # Unbox the events when droped.
  try({
    shiny::registerInputHandler("fc_events", function(data, ...) {
    jsonlite::fromJSON(data)
  })
  })
}