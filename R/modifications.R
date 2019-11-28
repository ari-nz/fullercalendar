


changeView <- function(fc, viewName) {

}



addEvent <- function(fc, event) {
  message <- as.list(event)
  session <- shiny::getDefaultReactiveDomain()
  session$sendCustomMessage("FullCalendar:addEvent", message)
}


firstDay<-function(fc, day = NULL){
  if(!is.null(day)) fc$x$settings$firstDay = day
  fc
}



fullercalendar(demoevents()) %>%
  firstDay(3)
