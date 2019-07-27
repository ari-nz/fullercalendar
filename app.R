library(shiny)
library(fullercalendar)

ui <- fluidPage(
  fullercalendarOutput('mycal')
)

server <- function(input, output, session) {
  output$mycal = renderFullercalendar({
    fc = fullercalendar()
    fc
  })

}

shinyApp(ui, server)