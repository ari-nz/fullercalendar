.onLoad <- function(libname, pkgname) {


  # Unbox the events when droped.
  try({
    shiny::registerInputHandler("fc_events", function(data, ...) {
      jsonlite::fromJSON(data)
    })
  })

  try({
    shiny::registerInputHandler("fc_select", function(data, ...) {
      jsonlite::fromJSON(data)
    })
  })

  try({
    shiny::registerInputHandler("fc_eventClick", function(data, ...) {
      data
    })
  })
}