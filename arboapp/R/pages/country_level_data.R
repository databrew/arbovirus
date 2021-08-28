library(shiny)

############## UI ######################
country_page_ui <- tagList(
  div(class = 'custom-container',
    h1("Country Page"),
    p("This is a country page"),
    textOutput('ServerTestCountry')
  )
)


############## SERVER ######################
country_page_server <- function(input, output, session) {
  output$ServerTestCountry <- renderText({
    '`Country` Server connected to the main'
  })
}