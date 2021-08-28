# library(shiny)
# library(tidyverse)
# library(ggplot2)

# ############## UI ######################
# regional_page_ui <- tagList(
#   div(class = 'custom-container',
#     h1("Regional Page"),
#     p("This is a regional page"),
#     textOutput('ServerTestRegional'),
#     fluidRow(
#       column(4,
#         selectInput(inputId = 'test',
#                     label = 'Test',
#                     choices = c('one', 'two', 'three', 'etc.'),
#                     width = '100%'
#         )
#       ),
#       column(8,
#         plotOutput('testPlot')
#       )
#     )
#   )
# )
# 
# ############## SERVER ######################
# regional_page_server <- function(input, output, session) {
#   output$ServerTestRegional <- renderText({
#     '`regional` Server connected to the main'
#   })
#   
#   output$testPlot <- renderPlot({
#     iris %>%
#       ggplot(aes(x = Species, y = Sepal.Length)) +
#         geom_boxplot()
#   })
# }