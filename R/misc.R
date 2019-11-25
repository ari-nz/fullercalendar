#' Turn POSIXct object to an ISO formatted time needed for the FullCalendar js to recognise
#'
#' @param time A POSIXct valid time object
#' @param tz A time zone string. By default will try to get it from the Posixct object, else will set to system locale
#'
#' @return a string following the pattern \code{\%Y-\%m-\%dT\%H:\%M:\%S\%z}.
#' @export
#'
#' @examples
#' isotime(Sys.time())
isotime<-function(time, tz = attr(time, "tzone")){

  if(is.null(tz)){
    tz = ""
  }

  strftime(time , "%Y-%m-%dT%H:%M:%S%z", tz=tz)
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