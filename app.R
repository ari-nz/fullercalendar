library(shiny)
library(fullercalendar)

ui <- fluidPage(
  actionButton('tor', 'To R'),
  fullercalendarOutput('mycal'),
  verbatimTextOutput('calinfo')
)

server <- function(input, output, session) {
  output$mycal = renderFullercalendar({
    fc = fullercalendar()
    fc
  })


  observeEvent(input$tor,{
    browser()


    fc_data = fc2r(output$mycal)

    output$calinfo <- renderPrint({ fc_data })
  })




}

shinyApp(ui, server)