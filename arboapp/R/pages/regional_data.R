library(shiny)

############## UI ######################
regional_page_ui <- tagList(
  div(class = 'custom-container',
    h1("Regional Page"),
    p("This is a regional page"),
    textOutput('ServerTestRegional')
  )
)

############## SERVER ######################
regional_page_server <- function(input, output, session) {
  output$ServerTestRegional <- renderText({
    '`regional` Server connected to the main'
  })
}