# library(shiny)
# 
# 
# ############## UI ######################
# about_page_ui <- tagList(
#   div(class = 'custom-container',
#     h1("About Page"),
#     p("This is a about page"),
#     textOutput('ServerTestAbout')
#   )
# )
# 
# 
# 
# ############## SERVER ######################
# about_page_server <- function(input, output, session) {
#   output$ServerTestAbout <- renderText({
#     '`About` Server connected to the main'
#   })
# }
