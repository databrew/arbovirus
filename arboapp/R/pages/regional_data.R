library(shiny)
library(dplyr)
library(ggplot2)

############## UI ######################
regional_page_ui <- tagList(
  div(class = 'custom-container',
    h1("Regional Page"),
    p("This is a regional page"),
    textOutput('ServerTestRegional'),
    fluidRow(
      column(4,
        selectInput(inputId = 'test',
                    label = 'Test',
                    choices = c('one', 'two', 'three', 'etc.'),
                    width = '100%'
        )
      ),
      column(8,
        plotOutput('testPlot')
      )
    )
  )
)

############## SERVER ######################
regional_page_server <- function(input, output, session) {
  
  require(shiny)
  require(dplyr)
  require(ggplot2)
  
  output$ServerTestRegional <- renderText({
    '`regional` Server connected to the main'
  })
  
  output$testPlot <- renderPlot({
    barplot(1:10)
  })
}