# Libraries
suppressPackageStartupMessages({
  library(shinyjs)
  library(dplyr)
  library(leaflet)
  library(ggplot2)
  library(readxl)
  library(flextable)
  library(stringr)
  library(pander)
  library(RColorBrewer)
  library(janitor)
  library(readr)
  library(shiny.router)
  library(tidyverse)
})

message('Working directory is: ', getwd())


### !!! Adjust the path according to your locale machine
# source('R/pages/global_data.R')
# source('R/pages/regional_data.R')
# source('R/pages/country_level_data.R')
# source('R/pages/indicators.R')
# source('R/pages/about.R')



######################## Global ###########################
############## UI Global ######################
global_page_ui <- tagList(
  div(class = 'custom-container',
      h1("Global Page"),
      p("This is a Global page"),
      textOutput('ServerTestGlobal')
  )
)



############## SERVER Global ######################
global_page_server <- function(input, output, session) {
  output$ServerTestGlobal <- renderText({
    '`Global` Server connected to the main'
  })
}


######################## Regional ###########################
############## UI Regional ######################
regional_page_ui <- tagList(
  div(class = 'custom-container',
      h1("Regional Page"),
      p("This is a regional page"),
      textOutput('ServerTestRegional'),
      fluidRow(
        # column(4,
        #        selectInput(inputId = 'test',
        #                    label = 'Select a region',
        #                    choices = c('one', 'two', 'three', 'four'),
        #                    width = '100%'
        #        )
        # ),
        # column(8,
        #        plotOutput('testPlot')
        # ),
        column(4,
              uiOutput("select_question")
        )
      )
  )
)

############## SERVER Regional ######################
regional_page_server <- function(input, output, session) {
  
  questions <- get_questions( )
  
  output$select_question <- renderUI({
    selectInput("select", label = h3("Select a question"), choices = questions )
  })
  
  output$ServerTestRegional <- renderText({
    '`regional` Server connected to the main'
  })
  
  # output$testPlot <- renderPlot({
  #     # ggplot(aes(x = Species, y = Sepal.Length)) +
  #     ggplot() +
  #     labs( title = input$test ) 
  # })
}


######################## Country ###########################
############## UI Country ######################
country_page_ui <- tagList(
  div(class = 'custom-container',
      h1("Country Page"),
      p("This is a country page"),
      textOutput('ServerTestCountry')
  )
)


############## SERVER Country ######################
country_page_server <- function(input, output, session) {
  output$ServerTestCountry <- renderText({
    '`Country` Server connected to the main'
  })
}


######################## Indicators ###########################
############## UI indicators ######################
indicators_page_ui <- tagList(
  div(class = 'custom-container',
      h1("Indicators Page"),
      p("This is a indicators page"),
      textOutput('ServerTestIndicators')
  )
)


############## SERVER indicators ######################
indicators_page_server <- function(input, output, session) {
  output$ServerTestIndicators <- renderText({
    '`Indicators` Server connected to the main'
  })
}


######################## About ###########################
############## UI About ######################
about_page_ui <- tagList(
  div(class = 'custom-container',
      h1("About Page"),
      p("This is a about page"),
      textOutput('ServerTestAbout')
  )
)



############## SERVER About ######################
about_page_server <- function(input, output, session) {
  output$ServerTestAbout <- renderText({
    '`About` Server connected to the main'
  })
}


router <- make_router(
  route("/", global_page_ui, global_page_server),
  route("regional", regional_page_ui, regional_page_server),
  route("country", country_page_ui, country_page_server),
  route("indicators", indicators_page_ui, indicators_page_server),
  route("about", about_page_ui, about_page_server)
)

#' The application User-Interface
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @import shiny.router
#' @import golem
#' @import leaflet
#' @import ggplot2
#' @import dplyr
#' @noRd

app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    
    # Your application UI logic 
    fluidPage(
      # theme = 'www/custom.css',
      # Main white navbar
      tags$div(class = 'flex-container',
        tags$h1(class = 'logo', tags$img(id = 'WHO_logo', src = 'www/WHO_Logo.png')),
        # tags$h1class = 'logo', tags$a(href = '#', 'Brand')),
        tags$ul(class = 'navigation',
                tags$li(a(href = '#', "Logout"))
        )
      ),
      # Blue navbar
      tags$ul(class = 'blue-sub-nav',
        tags$li(a(href = route_link("/"), "Global Data")),
        tags$li(a(href = route_link("regional"), "Regional Data")),
        tags$li(a(href = route_link("country"), "Country Level Data")),
        tags$li(a(href = route_link("indicators"), "Indicators")),
        tags$li(a(href = route_link("about"), "About"))
      ),
      
      # Footer
      tags$div(class = 'footer',
               p('Footer')
      ),
      
      # Important
      router$ui
      
    )
    
    
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
  
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'arboapp'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinyjs
#' @import shinydashboard
#' @import dplyr
#' @import leaflet
#' @import ggplot2
#' @import readxl
#' @import flextable
#' @import stringr
#' @import pander
#' @import RColorBrewer
#' @import janitor
#' @import readr
#' @noRd
app_server <- function( input, output, session ) {
  
  # Important
  router$server(input, output, session)

  # Load data
  data <- load_data()
  
  # load data dictionary to facilitate processing survey results:
  dict <- load_dict()

}

# Function for actually running app
app <- function(){
  # Detect the system. If on AWS, don't launch browswer
  is_aws <- grepl('aws', tolower(Sys.info()['release']))
  shinyApp(ui = app_ui,
           server = app_server,
           options = list('launch.browswer' = !is_aws))
}