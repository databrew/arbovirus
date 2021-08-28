library(shiny)

############## UI ######################
indicators_page_ui <- tagList(
  div(class = 'custom-container',
    h1("Indicators Page"),
    p("This is a indicators page"),
    textOutput('ServerTestIndicators')
  )
)


############## SERVER ######################
indicators_page_server <- function(input, output, session) {
  output$ServerTestIndicators <- renderText({
    '`Indicators` Server connected to the main'
  })
}