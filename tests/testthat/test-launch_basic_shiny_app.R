library(shiny)

now = Sys.time()
today = Sys.Date()
events = data.frame(title = paste("Event", 1:4),
                    start  = c(isodate(today+(-1:1)), isotime(now)),
                    end    = c(isodate(today+(0:2) ), isotime(now + 4800)),
                    color  = c("red", "#3788d8", "green", "blue"))


ui <- fluidPage(
  fullercalendarOutput('shiny_fc',width = '100%')
)

server <- function(input, output, session) {
  output$shiny_fc = renderFullercalendar(
    fullercalendar(events = events)
  )
}

app = shinyApp(ui, server)



test_that("Launch basic shiny application", {
  expect_equal(class(app), "shiny.appobj")
})
