


fc_changeView <- function(fc, viewName = NULL) {
  if(!is.null(viewName)) fc$x$defaultView = viewName
  fc
}
fc_gotoDate <- function(fc, date = NULL) {
  if(!is.null(date)) fc$x$defaultDate = date
  fc
}



fc_addEvent <- function(fc, event) {
  message <- as.list(event)
  session <- shiny::getDefaultReactiveDomain()
  session$sendCustomMessage("FullCalendar:addEvent", message)
}


fc_firstDay<-function(fc, day = NULL){
  if(!is.null(day)) fc$x$settings$firstDay = day
  fc
}



fullercalendar(demoevents()) %>%
  # firstDay(3) %>%
  fc_changeView('timeGridWeek')
