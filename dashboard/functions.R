library(tidyverse)
library(stringr)
library(pander)
panderOptions( 'p.wrap', "")
library(knitr)
library(kableExtra)
library(flextable)
library(lubridate)
library(RColorBrewer)
library(janitor)
library(officer)
library(english)

make_colors <- function(n, seed = 123){
  pal <- RColorBrewer::brewer.pal(n = 9, name = 'Set1')
  set.seed(seed)
  pal <- sample(pal, length(pal))
  out <- colorRampPalette(pal)(n)
  return(out)
}

load_dict <- function(){
  if( file.exists("../data/Data_dictionary_Survey375147.csv")){
    dict <- read_csv("../data/Data_dictionary_Survey375147.csv")
  } else{
    message("You need the data dictionary!")
  }
  return( dict )
}

load_regions_countries <- function(){
  if( file.exists("../data/Regions_Countries.csv")){
    regions_countries <- read_csv("../data/Regions_Countries.csv")
  } else{
    message("You need the regions/countries data!")
  }
  return( regions_countries )
}


# Function to simplify variable names
simplify_data <- function(data,
                          dict){
  # # Having retrieved the data, extract only those variables of relevance
  # 1. Surveillance capacity indicators:
  # • Reportable arboviral diseases (q11, q11b)
  # • History of any arbovirus circulation since 2000 (q5)
  # • Conducting surveillance on humans (q12), vectors (q28) animals (q41)
  # • Training of surveillance personnel and clinicians? (q10) (q24)
  # • Presence written arbovirus surveillance and control plans? (q6)
  # • Arbovirus program independent or integrated: (q7)
  # • Tools for case reporting: (q9)
  # 2. Laboratory diagnostic capacity indicators:
  # • Testing in outbreak vs non-outbreak settings (q15)
  # • Laboratory tests available (q17)
  # • Serotyping and sequencing capacity? (q19)
  # 3. Response capacity indicators:
  # • Surveillance and control plans available (q 6)
  # • Clinical guidelines for healthcare workers (q21)
  # • Vector control method employed (q35)
  # • Surveillance and response committee exists (q47)
  # • Contingency plan exists (q48)
  # • Most common vector control methods used (q35)
  # • Indicators used for thresholds (q37, 37b, 38)
  # • Insecticide resistance: (q39)
  # • Criteria for declaring an outbreak (q49)
  # 4. Epidemiologic risk data:
  # • Vectors present and level of risk (q34, q34b, q34c)
  # • Entomological surveillance in the last 2 years (q28)
  # • How often is conducted: (q28e)
  # • Vectors recorded in the last 5 years (q34) and the public health threat (34b, 34c)
  # • All arboviruses 2015-2020 (cases and deaths) (q55, b, c): trends if possible
  # • Most recent year data (q56)
  
  keep_questions <- c(
    '1',
    '11', '11b',
    '5', 
    '12', '28', '41',
    '10', '24',
    '6',
    '7',
    '9',
    '15', '17',
    '19',
    '6', '21',
    '35',
    '47',
    '48',
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
  return(df)
}

#' @param modify_variable_names If TRUE, then variable names will be overwritten / modified to be more meaningful
load_data <- function(combined = TRUE, modify_variable_names = FALSE, complete=TRUE){
  
  if( combined ){
    path = "../data/combined_data.RData"
  } else{
    path = "../data/data.RData"
  }
  
  if( file.exists( path )){
    load( path )
  } else{
    message("You need the data!")
  }

  # Read in data dictionary
  dict <- load_dict()
  
  # Modify variable names
  if(modify_variable_names){
   df <- simplify_data(data = data,
                       dict = dict)
  } else {
    if(complete){
      q5_start <- min( which( dict$`Question number` == "5") )
      incomplete_surveys <- c()
      for( i in 1:nrow(data)){
        if( all( is.na( data[i, q5_start:nrow( dict )]))){
          incomplete_surveys <- c( incomplete_surveys, i)
        }
      }
      if( length( incomplete_surveys) > 0){
        df <- data[-incomplete_surveys,]
      } else{
        df <- data
      }
    } else{
      # in this case, include incomplete survey results (for participation summary)
      df <- data
    }
  }
  
  return(df)
}

# simple <- load_data(modify_variable_names = TRUE)
# write_excel_csv(simple, '~/Desktop/simplified_dataset.csv')

# get_responses assumes that load_dict() and load_data() have been called!

get_responses <- function( question_number ){
  idx <- which( dict$`Question number` == question_number )
  # question <- dict$Description[ idx[1] ] #
  # cat( paste("Question", question_number, ":", question) ) #
  var_names <- dict$`Variable name`[idx]
  responses <- data %>% select( all_of(var_names) )
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
                     line_color = 'white',
                     qualitative = FALSE,
                     opacity = 0.8,
                     provider = providers$Esri.WorldShadedRelief, #providers$OpenStreetMap,
                     rev = TRUE,
                     add_base_layer = TRUE,
                     label_string = NULL,
                     legend_title = ' ',
                     use_who_shp = FALSE,
                     filter_region = NULL,
                     static = FALSE,
                     remove_some = FALSE,
                     add_legend = TRUE){
  
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
  
  if(!is.null(filter_region)){
    keep_countries <- who_shp$adm0$adm0_viz_n[who_shp$adm0$who_region == filter_region]
    df <- df %>%
      filter(country %in% keep_countries)
  }
  
  # Join shapefile and map data
  if(use_who_shp){
    if(is_regional){
      shp <- who_shp$adm0
      shp <- sf::as_Spatial(shp)
      shpx <- rgeos::gUnaryUnion(shp, id = shp@data$who_region)
      x <- SpatialPolygonsDataFrame(Sr = shpx, data = data.frame(who_region = names(shpx)), match.ID = FALSE)
      shp@data$ID <- shp@data$who_region
    } else {
      shp <- who_shp$adm0
      shp <- sf::as_Spatial(shp)
      shp@data$country <- shp@data$adm0_viz_n
      if(!is.null(filter_region)){
        shp <- shp[ shp@data$country %in% keep_countries,]
      }
      if(remove_some){
        shp <- shp[!shp@data$country %in% c('Russian Federation',
                                            'Greenland'),]
      }
    }
    
  } else {
    if(is_regional){
      shp <- region_shp
    } else {
      shp <- world_shp
      if(!is.null(filter_region)){
        shp <- shp[ shp@data$country %in% keep_countries,]
      }
      if(remove_some){
        shp <- shp[!shp@data$country %in% c('Russian Federation',
                                            'Greenland'),]
      }
    }
  }

  shp@data <- left_join(shp@data, df)
  
  
  # Define color palette and values to show in tooltip
  if(qualitative){
    # pal <- 'Set3'
    pal_fun <- colorFactor(palette = pal, domain=shp@data$value, na.color="transparent", reverse = rev)
    vals <- shp@data$value
    
  } else {
    pal_fun <- colorNumeric(palette=pal, domain=shp@data$value, na.color="transparent", reverse = rev)
    vals <- round(shp@data$value, 2)
  }
  
  if(static){
    shp_fortified <- fortify(shp, region = 'adm0_viz_n')
    shp_fortified <- left_join(shp_fortified, shp@data, by = c('id' = 'adm0_viz_n'))
    g <- ggplot(data = shp_fortified,
                aes(x = long,
                    y = lat,
                    group = group)) +
      geom_polygon(fill = 'black', color = line_color, size = 0.4) +
      geom_polygon(color = line_color, size = 0.2,
                   aes(fill = value))
    g
  } else {
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
      "Survey: ", vals, 
      sep="") %>%
      lapply(htmltools::HTML)
    if(!is.null(label_string)){
      # overwrite the labels
      tool_tip <- paste0(part1, part2,     
                         "<br/>", 
                         label_string, ": ", 
                         vals, sep = "")  %>%
        lapply(htmltools::HTML)
    }
    m <- leaflet(shp)
    if(add_base_layer){
      m <- m %>%
        addProviderTiles(provider = provider) 
    }
    m <- m %>%
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
      setView( lat=10, lng=0 , zoom=2) 
    
    if(add_legend){
    m <- m %>%  addLegend( pal=pal_fun, values=~value, opacity=0.9, title = legend_title, position = "bottomleft" )
    }
      
    m
  }
  
  
}
