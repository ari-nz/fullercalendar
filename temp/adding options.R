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
                  end    = c(as.character(today+(0:1) ),NA, isotime(now + 4800)),
                  color  = c("red", "#3788d8", "green", "blue"))




fc = fullercalendar(events =  data)



# fc_selecting()

fc_to_r<-function(...){
  dots = c(...)
  bound =data.table::rbindlist(jsonlite::parse_json(dots), fill = TRUE)
  bound$start = fasttime::fastPOSIXct(bound$start, tz = Sys.timezone(), required.components = 6)
  bound$end = fasttime::fastPOSIXct(bound$end, tz = Sys.timezone(), required.components = 6)

  as.data.frame(bound)

}


library(shiny)

ui <- fluidPage(
 fluidRow(
  actionButton('btn','lbl')
 ),
 fluidRow(
  fullercalendarOutput('test', height = '400px'),
  DT::dataTableOutput("df")
 )
)

server <- function(input, output, session) {
  output$test =  renderFullercalendar(fullercalendar(data))

  observeEvent(input$btn, {
    df = input$test
    output$df = DT::renderDataTable(df) %>%
      DT::formatDate(c('start','end'), 'toLocaleString')
  })
}

runApp(list(ui=ui, server=server),launch.browser = TRUE)














ui <- fluidPage(
  fluidRow(
    actionButton('btn','lbl'),
    actionButton('dbg','dbg')

  ),
  fluidRow(
    fullercalendarOutput('test', height = '400px'),
    DT::dataTableOutput("df")
  )
)

server <- function(input, output, session) {
  output$test =  renderFullercalendar(
    fullercalendar(demoevents(),
                   defaultView = "timeGridWeek",
                   weekends = TRUE,
                   minTime= '05:00:00',
                   maxTime= '22:00:00',
                   slotDuration = '00:15:00',
                   scrollTime = '10:00:00',
                   firstDay = 1,
                   selectable = TRUE,
                   selectMirror = TRUE,
                   editable = TRUE,
                   dropable = TRUE
                   )
    )

  observeEvent(input$dbg, {
    browser()
  })

  observeEvent(input$test, {
    df = input$test
    df$start = as.character(df$start)
    df$end = as.character(df$end)
    output$df = DT::renderDataTable(df[,1:8], extensions = 'FixedColumns',
                                    options = list(
                                      dom = 't',
                                      scrollX = TRUE,
                                      fixedColumns = TRUE
                                    ))
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
    df$start = as.POSIXct(df$start)
    output$df = renderPrint(df)
  })
}

shinyApp(ui, server)








