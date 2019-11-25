#' Turn POSIXct object to an ISO formatted time needed for the FullCalendar js to recognise
#'
#' @param time A POSIXct valid time object
#'
#' @return a string following the pattern \code{\%Y-\%m-\%dT\%H:\%M:\%S\%z}.
#' @export
#'
#' @examples
#' isotime(Sys.time())
isotime<-function(time){
  strftime(time , "%Y-%m-%dT%H:%M:%S%z")
}


#' Turn Date object to a formatted date needed for the FullCalendar js to recognise
#'
#' @param date A valid Date object
#'
#' @return a string of the date
#' @export
#'
#' @examples
#' isodate(Sys.Date())
isodate<-function(date){
  as.character(date)
}