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




#' Create demo date events
#'
#' @return Data which is capable of being used in fullercalendar, with datetimes roughly around the users current system time
#' @export
#' @rdname fullercalendar-demoevents
#' @examples
#' demoevents()
demoevents<-function(){
  now = round_time(Sys.time(), 5)
  today = Sys.Date()
  events = data.frame(title = paste("Event", 0:3),
                    start  = c(isodate(today+(-1:1)), isotime(now)),
                    end    = c(isodate(today+(0:2) ), isotime(now + 4800)),
                    color  = c("red", "#3788d8", "green", "blue"),
                    stringsAsFactors = FALSE)
  return(events)
}





#' @rdname fullercalendar-demoevents
#' @export
#' @examples
#' randomevents()
randomevents<-function(){




  nevents = max(3, stats::rpois(1,7))

  now = Sys.time()
  today = Sys.Date()

  lengths_opts = c(0.25, 0.5, 0.75, 1, 1.5, 2, 2.5, 4)
  lengths_prob = unit_vector( 1/lengths_opts)

  event_starts = now + stats::runif(nevents, -3.5, 3.5) * 86400
  event_starts = sort(round_time(event_starts, 15))
  event_ends = event_starts + sample(lengths_opts, prob = lengths_prob, size = nevents, replace = TRUE) * 3600

  events = data.frame(title = paste("Event", 0:(nevents-1)),
                      start  = isotime(event_starts),
                      end    = isotime(event_ends),
                      color  = as.character(sample(html_colours, nevents)),
                      borderColor = "#000000"
  )

  ## Do some colour correction for the text
  rgb_cols = grDevices::col2rgb(events$color)
  black_contrast = (299*(255-rgb_cols[1,]) + 587*(255-rgb_cols[2,]) + 114*(255-rgb_cols[3,])) / 1000
  white_contrast = (299*rgb_cols[1,] + 587*rgb_cols[2,] + 114*rgb_cols[3,]) / 1000
  text_col = ifelse(black_contrast <= white_contrast, 'black', 'white')

  events$textColor = text_col

  events
}



round_time<-function(time, minround){
  as.POSIXlt(round(as.double(time)/(minround*60))*(minround*60),origin=(as.POSIXlt('1970-01-01')))
}



unit_vector  = function(x) {x / sqrt(sum(x^2))}



html_colours = c(
"AliceBlue"             =   "#F0F8FF",
"AntiqueWhite"          =   "#FAEBD7",
"Aqua"                  =   "#00FFFF",
"Aquamarine"            =   "#7FFFD4",
"Azure"                 =   "#F0FFFF",
"Beige"                 =   "#F5F5DC",
"Bisque"                =   "#FFE4C4",
"Black"                 =   "#000000",
"BlanchedAlmond"        =   "#FFEBCD",
"Blue"                  =   "#0000FF",
"BlueViolet"            =   "#8A2BE2",
"Brown"                 =   "#A52A2A",
"BurlyWood"             =   "#DEB887",
"CadetBlue"             =   "#5F9EA0",
"Chartreuse"            =   "#7FFF00",
"Chocolate"             =   "#D2691E",
"Coral"                 =   "#FF7F50",
"CornflowerBlue"        =   "#6495ED",
"Cornsilk"              =   "#FFF8DC",
"Crimson"               =   "#DC143C",
"Cyan"                  =   "#00FFFF",
"DarkBlue"              =   "#00008B",
"DarkCyan"              =   "#008B8B",
"DarkGoldenRod"         =   "#B8860B",
"DarkGray"              =   "#A9A9A9",
"DarkGrey"              =   "#A9A9A9",
"DarkGreen"             =   "#006400",
"DarkKhaki"             =   "#BDB76B",
"DarkMagenta"           =   "#8B008B",
"DarkOliveGreen"        =   "#556B2F",
"DarkOrange"            =   "#FF8C00",
"DarkOrchid"            =   "#9932CC",
"DarkRed"               =   "#8B0000",
"DarkSalmon"            =   "#E9967A",
"DarkSeaGreen"          =   "#8FBC8F",
"DarkSlateBlue"         =   "#483D8B",
"DarkSlateGray"         =   "#2F4F4F",
"DarkSlateGrey"         =   "#2F4F4F",
"DarkTurquoise"         =   "#00CED1",
"DarkViolet"            =   "#9400D3",
"DeepPink"              =   "#FF1493",
"DeepSkyBlue"           =   "#00BFFF",
"DimGray"               =   "#696969",
"DimGrey"               =   "#696969",
"DodgerBlue"            =   "#1E90FF",
"FireBrick"             =   "#B22222",
"FloralWhite"           =   "#FFFAF0",
"ForestGreen"           =   "#228B22",
"Fuchsia"               =   "#FF00FF",
"Gainsboro"             =   "#DCDCDC",
"GhostWhite"            =   "#F8F8FF",
"Gold"                  =   "#FFD700",
"GoldenRod"             =   "#DAA520",
"Gray"                  =   "#808080",
"Grey"                  =   "#808080",
"Green"                 =   "#008000",
"GreenYellow"           =   "#ADFF2F",
"HoneyDew"              =   "#F0FFF0",
"HotPink"               =   "#FF69B4",
"IndianRed"             =   "#CD5C5C",
"Indigo"                =   "#4B0082",
"Ivory"                 =   "#FFFFF0",
"Khaki"                 =   "#F0E68C",
"Lavender"              =   "#E6E6FA",
"LavenderBlush"         =   "#FFF0F5",
"LawnGreen"             =   "#7CFC00",
"LemonChiffon"          =   "#FFFACD",
"LightBlue"             =   "#ADD8E6",
"LightCoral"            =   "#F08080",
"LightCyan"             =   "#E0FFFF",
"LightGoldenRodYellow"  =   "#FAFAD2",
"LightGray"             =   "#D3D3D3",
"LightGrey"             =   "#D3D3D3",
"LightGreen"            =   "#90EE90",
"LightPink"             =   "#FFB6C1",
"LightSalmon"           =   "#FFA07A",
"LightSeaGreen"         =   "#20B2AA",
"LightSkyBlue"          =   "#87CEFA",
"LightSlateGray"        =   "#778899",
"LightSlateGrey"        =   "#778899",
"LightSteelBlue"        =   "#B0C4DE",
"LightYellow"           =   "#FFFFE0",
"Lime"                  =   "#00FF00",
"LimeGreen"             =   "#32CD32",
"Linen"                 =   "#FAF0E6",
"Magenta"               =   "#FF00FF",
"Maroon"                =   "#800000",
"MediumAquaMarine"      =   "#66CDAA",
"MediumBlue"            =   "#0000CD",
"MediumOrchid"          =   "#BA55D3",
"MediumPurple"          =   "#9370DB",
"MediumSeaGreen"        =   "#3CB371",
"MediumSlateBlue"       =   "#7B68EE",
"MediumSpringGreen"     =   "#00FA9A",
"MediumTurquoise"       =   "#48D1CC",
"MediumVioletRed"       =   "#C71585",
"MidnightBlue"          =   "#191970",
"MintCream"             =   "#F5FFFA",
"MistyRose"             =   "#FFE4E1",
"Moccasin"              =   "#FFE4B5",
"NavajoWhite"           =   "#FFDEAD",
"Navy"                  =   "#000080",
"OldLace"               =   "#FDF5E6",
"Olive"                 =   "#808000",
"OliveDrab"             =   "#6B8E23",
"Orange"                =   "#FFA500",
"OrangeRed"             =   "#FF4500",
"Orchid"                =   "#DA70D6",
"PaleGoldenRod"         =   "#EEE8AA",
"PaleGreen"             =   "#98FB98",
"PaleTurquoise"         =   "#AFEEEE",
"PaleVioletRed"         =   "#DB7093",
"PapayaWhip"            =   "#FFEFD5",
"PeachPuff"             =   "#FFDAB9",
"Peru"                  =   "#CD853F",
"Pink"                  =   "#FFC0CB",
"Plum"                  =   "#DDA0DD",
"PowderBlue"            =   "#B0E0E6",
"Purple"                =   "#800080",
"RebeccaPurple"         =   "#663399",
"Red"                   =   "#FF0000",
"RosyBrown"             =   "#BC8F8F",
"RoyalBlue"             =   "#4169E1",
"SaddleBrown"           =   "#8B4513",
"Salmon"                =   "#FA8072",
"SandyBrown"            =   "#F4A460",
"SeaGreen"              =   "#2E8B57",
"SeaShell"              =   "#FFF5EE",
"Sienna"                =   "#A0522D",
"Silver"                =   "#C0C0C0",
"SkyBlue"               =   "#87CEEB",
"SlateBlue"             =   "#6A5ACD",
"SlateGray"             =   "#708090",
"SlateGrey"             =   "#708090",
"Snow"                  =   "#FFFAFA",
"SpringGreen"           =   "#00FF7F",
"SteelBlue"             =   "#4682B4",
"Tan"                   =   "#D2B48C",
"Teal"                  =   "#008080",
"Thistle"               =   "#D8BFD8",
"Tomato"                =   "#FF6347",
"Turquoise"             =   "#40E0D0",
"Violet"                =   "#EE82EE",
"Wheat"                 =   "#F5DEB3",
"White"                 =   "#FFFFFF",
"WhiteSmoke"            =   "#F5F5F5",
"Yellow"                =   "#FFFF00",
"YellowGreen"           =   "#9ACD32"
)


