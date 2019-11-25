library(fullercalendar)
library(shiny)
library(tibble)


now = Sys.time()
today = Sys.Date()
isotime<-function(time){
  strftime(time , "%Y-%m-%dT%H:%M:%S%z")
}
data = data.frame(title = paste("Event", 1:4),
                  start  = c(as.character(today+(-1:1)), isotime(now)),
                  end    = c(as.character(today+(0:2) ), isotime(now + 4800)),
                  color  = c("red", "#3788d8", "green", "blue"))




# fc = fullercalendar(events =  data)



# fc_selecting()

fc_to_r<-function(...){
  dots = c(...)
  do.call(rbind, jsonlite::parse_json(dots))
}


library(shiny)

ui <- fluidPage(
  actionButton('btn','lbl'),
 fullercalendarOutput('test'),
 textOutput("df")
)

server <- function(input, output, session) {
    output$test =  renderFullercalendar(fullercalendar(data))
  observeEvent(input$btn, {
    df = fc_to_r(input$test)
    output$df = renderPrint(df)
  })
}

runApp(list(ui=ui, server=server),launch.browser = TRUE)




library(shiny)

ui <- fluidPage(
  actionButton('btn','lbl'),
  rHandsontableOutput('test'),
  textOutput("df")
)

server <- function(input, output, session) {
  output$test =  renderRHandsontable(rhandsontable(iris))
  observeEvent(input$btn, {
    browser()
    df = hot_to_r(input$test)
    output$df = renderPrint(df)
  })
}

shinyApp(ui, server)








