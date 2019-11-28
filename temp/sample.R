

library(rhandsontable)
library(fullercalendar)
library(shiny)
library(tibble)

now = Sys.time()
today = Sys.Date()
data = data.frame(title = paste("Event", 0:3),
                 start  = c(isodate(today+(-1:1)), isotime(now)),
                 end    = c(isodate(today+(0:2) ), isotime(now + 4800)),
                 color  = c("red", "#3788d8", "green", "blue"),
                 stringsAsFactors = FALSE)


fullercalendar(events =  data)





ui_1 <- fluidPage(
  fullercalendar(events = data,width = '100%')
)

server_1 <- function(input, output, session) {

}

runApp(list(ui =ui_1,server= server_1), launch.browser = TRUE)






ui_2 <- fluidPage(
  fluidRow(
    column(6,fullercalendar(events = data,width = '100%')),
    column(6,fullercalendarOutput('renderCal',width = '100%'))
  )
)

server_2 <- function(input, output, session) {
  output$renderCal = renderFullercalendar(
    fullercalendar(events = data)
  )
}

shinyApp(ui_2, server_2)








ui_3 <- fluidPage(
           fullercalendarOutput('renderCal',width = '100%')
)

server_3 <- function(input, output, session) {
  output$renderCal = renderFullercalendar(
    fullercalendar(events = data)
  )
}

shinyApp(ui_3, server_3)