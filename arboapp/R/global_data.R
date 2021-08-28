# library(shiny)
# 
# 
# ############## UI ######################
# global_page_ui <- tagList(
#   div(class = 'custom-container',
#     h1("Global Page"),
#     p("This is a Global page"),
#     textOutput('ServerTestGlobal')
#   )
# )
# 
# 
# 
# ############## SERVER ######################
# global_page_server <- function(input, output, session) {
#   output$ServerTestGlobal <- renderText({
#     '`Global` Server connected to the main'
#   })
# }