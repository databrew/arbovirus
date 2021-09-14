library(tidyverse)
library(stringr)
library(pander)
library(knitr)
library(flextable)
library(lubridate)
library(RColorBrewer)
library(janitor)

make_colors <- function(n, seed = 123){
  pal <- RColorBrewer::brewer.pal(n = 9, name = 'Set1')
  set.seed(seed)
  pal <- sample(pal, length(pal))
  out <- colorRampPalette(pal)(n)
  return(out)
}

load_dict <- function(){
  owd <- getwd()
  setwd('../')
  if( file.exists("misc/Data_dictionary_Survey375147_unabridged.csv")){
    dict <- read_csv("misc/Data_dictionary_Survey375147_unabridged.csv")
  } else{
    message("You need the data dictionary!")
  }
  setwd(owd)
  
  return( dict )
}

#' @param modify_variable_names If TRUE, then variable names will be overwritten / modified to be more meaningful
load_data <- function(modify_variable_names = FALSE){
  # Read in data
  owd <- getwd()
  setwd('../')
  if( file.exists("data/data.RData")){
    load("data/data.RData")
  } else{
    message("You need the data!")
  }

  setwd(owd)
  
  # Read in data dictionary
  dict <- load_dict()
  
  # # Having retrieved the data, extract only those variables of relevance
  # 1. Surveillance capacity indicators:
  #   • Reportable arboviral diseases (q11, q11b)
  # • History of any arbovirus circulation since 2000 (q5)
  # • Conducting surveillance on humans (q12), vectors (q28) animals (q41)
  # • Training of surveillance personnel and clinicians? (q10) (q24)
  # • Presence written arbovirus surveillance and control plans? (q6)
  # • Arbovirus program independent or integrated: (q7)
  # • Tools for case reporting: (q9)
  # 2. Laboratory diagnostic capacity indicators:
  #   • Testing in outbreak vs non-outbreak settings (q15)
  # • Laboratory tests available (q17)
  # • Serotyping and sequencing capacity? (q19)
  # 3. Response capacity indicators:
  #   • Surveillance and control plans available (q 6)
  # • Clinical guidelines for healthcare workers (q21)
  # • Vector control method employed (q35)
  # • Surveillance and response committee exists (q47)
  # • Contingency plan exists (q48)
  # • Most common vector control methods used (q35)
  # • Indicators used for thresholds (q37, 37b, 38)
  # • Insecticide resistance: (q39)
  # • Criteria for declaring an outbreak (q49)
  # 4. Epidemiologic risk data:
  #   • Vectors present and level of risk (q34, q34b, q34c)
  # • Entomological surveillance in the last 2 years (q28)
  # • How often is conducted: (q28e)
  # • Vectors recorded in the last 5 years (q34) and the public health threat (34b, 34c)
  # • All arboviruses 2015-2020 (cases and deaths) (q55, b, c): trends if possible
  # • Most recent year data (q56)
  
  keep_questions <- c(
    '1',
    '11', '11b',
    '5', 
    '12',
    '28', '41',
    '10', '24',
    '6',
    '7',
    '9',
    '15', '17',
    '19',
    '6', '21',
    '35',
    '37', '37b', '38',
    '39',
    '49',
    '34', '34b', '34c',
    '28',
    '28e',
    '34', '34b', '34c',
    '55', '55b', '55c',
    '56')
  df <- data[,c(dict$`Variable name`[dict$`Question number` %in% keep_questions], 'Region')]
  
  # Modify variable names
  if(modify_variable_names){
    sub_dict <- dict %>%
      filter(`Question number` %in% keep_questions)
    
    # Go variable by variable and get a new field name
    show_it <- function(x, condition = NULL){
      if(is.null(condition)){
        ifelse(!is.na(x), 
               x, 
               '')
      } else {
        ifelse(!is.na(condition),
               x,
               '')
      }
    }
    sub_dict <- sub_dict %>%
      mutate(field_name = paste0(show_it(`Question number`),
                                 show_it('. ', condition = `Question number`),
                                 show_it(' ', condition = Description),
                                 show_it(`Description`),
                                 show_it(' ', condition = `Subquestion`),
                                 show_it(`Subquestion`)))
    for(i in 1:nrow(sub_dict)){
      this_variable_name <- sub_dict$`Variable name`[i]
      this_column_index <- which(names(df) == this_variable_name)
      this_new_name <- sub_dict$field_name[i]
      names(df)[this_column_index] <- this_new_name
    }
    names(df)[1] <- '1. State'
    names(df) <- gsub("\\[|\\]", "", names(df))
    names(df) <- trimws(names(df))
    names(df)[names(df) == 'Region'] <- 'region'
    df$region <- as.character(df$region)
  }
  
  return(df)
}
simple <- load_data(modify_variable_names = TRUE)
write_excel_csv(simple, '~/Desktop/simplified_dataset.csv')

# get_responses assumes that load_dict() and load_data() have been called!

get_responses <- function( question_number ){
  idx <- which( dict$`Question number` == question_number )
  # question <- dict$Description[ idx[1] ]
  # cat( paste("Question", question_number, ":", question) )
  var_names <- dict$`Variable name`[idx]
  responses <- df %>% select( all_of(var_names) )
  if( !is.na(dict$Subquestion[ idx[1] ]) ){
    # remove square brackets at beginning and end, then rename columns:
    colnames( responses ) <- str_extract( dict$Subquestion[idx], '(?<=\\[)[^{}]+(?=\\])')
  } else{
    colnames( responses ) <- "Response"
  }
  return( responses )
}

# rmarkdown::render('region.Rmd')
# rmarkdown::render('country.Rmd')
# rmarkdown::render('about.Rmd')

#' Make map
#' @description Make a leaflet map given a dataframe with two columns: country and value
#' @return A leaflet object
#' @noRd
#' @import leaflet
#' @import dplyr
#' @import sp
make_map <- function(df,
                     pal = 'YlGnBu',
                     qualitative = FALSE,
                     opacity = 0.8,
                     provider = providers$OpenStreetMap){
  
  # load('../data/world_shp.rda')
  # df <- tibble(country = c('France', 'Germany', 'Spain'),
  #              value = c(1,2,3))
  # df$value <- c('A', 'b', 'CCC')
  
  
  # See if is regional or not
  is_regional <- 'region' %in% names(df)
  
  # See if qualitative (override logic)
  if(!qualitative){
    if(!is.numeric(df$value)){
      qualitative <- TRUE
    }
  }
  
  if(is_regional){
    # Remove duplicates
    df <- df %>% filter(!duplicated(region))
    if(qualitative){
      # regional, qualitative
      df <- df %>%
        group_by(region) %>%
        summarise(value = length(which(value == 'Yes')))
    } else {
      # regional, quantitative
      df <- df %>%
        group_by(region) %>%
        summarise(value = mean(value, na.rm = TRUE))
    }
  } else {
    # Remove duplicates
    df <- df %>% filter(!duplicated(country))
  }
  
  # Join shapefile and map data
  if(is_regional){
    shp <- region_shp
  } else {
    shp <- world_shp
  }
  shp@data <- left_join(shp@data, df)
  
  
  # Define color palette and values to show in tooltip
  if(qualitative){
    # pal <- 'Set3'
    pal_fun <- colorFactor(palette = pal, domain=shp@data$value, na.color="transparent", reverse = TRUE)
    vals <- shp@data$value
    
  } else {
    pal_fun <- colorNumeric(palette=pal, domain=shp@data$value, na.color="transparent")
    vals <- round(shp@data$value, 2)
  }
  
  # Prepare the text for tooltips:
  if(is_regional){
    part1 <- 'Region: '
    part2 <- shp@data$region
  } else {
    part1 <- 'Country: '
    part2 <- shp@data$country
  }
  tool_tip <- paste(
    part1,
    part2, 
    "<br/>", 
    "Value: ", vals, 
    sep="") %>%
    lapply(htmltools::HTML)
  
  m <- leaflet(shp) %>% 
    addProviderTiles(provider = provider)  %>% 
    addPolygons( 
      fillColor = ~pal_fun(value), 
      color = 'black',
      stroke=TRUE, 
      fillOpacity = opacity, 
      # color="white", 
      weight=1.3,
      label = tool_tip,
      labelOptions = labelOptions( 
        style = list("font-weight" = "normal", padding = "3px 8px"), 
        textsize = "13px", 
        direction = "auto"
      )
    ) %>%
    addLegend( pal=pal_fun, values=~value, opacity=0.9, title = " ", position = "bottomleft" ) %>%
    setView( lat=10, lng=0 , zoom=2) 
  m
}
