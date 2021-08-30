#' Data read in
#' @description Function for reading in data
#' @return A dataframe
#' @noRd
load_data <- function(){
  ok <- FALSE
  if(dir.exists('data')){
    if(dir.exists('misc')){
      if('survey_375147_R_syntax_file.R' %in% dir('misc')){
        ok <- TRUE
      }
    }
  }
  if(!ok){
    stop('Make sure you have the dev/data and dev/misc folders populated appropriately.')
  }
  if( file.exists("data/data.RData" )){
    load("data/data.RData")
  } else{
    source("misc/survey_375147_R_syntax_file.R")
    n_countries <- length( data$SI01 )
    who_regions <- read_excel("data/Regions_Countries.xlsx")
    region <- character( length=n_countries )
    for(i in 1:n_countries){
      idx <- which( who_regions$Country == data$SI01[i] )
      if( length(idx) > 0 ){
        region[i] <- who_regions$Region[idx]
      } else{
        region[i] <- NA
      }
    }
    # Region needs to be the last column to maintain consistency between data and dictionary!
    data <- data %>% mutate( Region = factor(region) )
    save(data, file="data/data.RData")
  }
  
  # Iceland is for testing purposes only; remove for analysis:
  data <- data %>%
    filter( SI01 != "Iceland")
  
  # Return data
  return(data)
}

#' Load dictionary
#' @description Function for loading dictionary
#' @return A dataframe
#' @noRd
load_dict <- function(){
  read_csv("misc/Data_dictionary_Survey375147.csv")
}

#' Questions standardizer
#' @description Function for retrieving question numbers
#' @return A character vector
#' @noRd
get_questions <- function( ){
  # NOTE: We should only have to read each CSV once!
  dict <- read_csv("misc/Data_dictionary_Survey375147.csv")
  idx <- c( which( is.na( dict$`Question number` )),
            which( grepl('upload', dict$`Type of variable`)),
            which ( grepl('filecount', dict$`Question number`) ))
  questions <- dict$`Question number`[-idx]
  idx <- which( questions == "5" )
  questions <- unique( questions[ idx:length( questions )] )
  return( questions )
}

#' Questions standardizer
#' @description Function for retrieving question text
#' @return A character string
#' @noRd
get_question_text <- function( question_number ){
  # NOTE: We should only have to read each CSV once!
  dict <- read_csv("misc/Data_dictionary_Survey375147.csv")
  idx <- min( which( dict$`Question number` == question_number ) )
  question_text <- dict$Description[ idx ]
  return( question_text )
}

#' Responses standardizer
#' @description Function for retrieving responses to a given question
#' @return A dataframe
#' @noRd
get_responses <- function( question_number ){
  # NOTE: We should only have to read each CSV once!
  dict <- read_csv("misc/Data_dictionary_Survey375147.csv")
  idx <- which( dict$`Question number` == question_number )
  var_names <- dict$`Variable name`[idx]
  responses <- data[ var_names ] 
  if( !is.na(dict$Subquestion[ idx[1] ]) ){
    # remove square brackets at beginning and end, then rename columns:
    colnames( responses ) <- str_extract( dict$Subquestion[idx], '(?<=\\[)[^{}]+(?=\\])')
  } else{
    colnames( responses ) <- "Response"
  }
  return( responses )
}

#' Regions standardizer
#' @description Function for retrieving WHO region names
#' @return A character vector
#' @noRd
get_regions <- function( ){
  # NOTE: We should only have to load data once!
  load("data/data.RData")
  regions <- levels( data$Region )
  return( regions )
}

#' Responses standardizer
#' @description Function for tabulation of responses by region
#' @return A dataframe
#' @noRd
get_region_table <- function( question_number ){
  # NOTE: Should only have to load data once!
  load("data/data.RData")
  # NOTE: We should only have to read each CSV once!
  dict <- read_csv("misc/Data_dictionary_Survey375147.csv")
  idx <- which( dict$`Question number` == question_number )
  var_names <- dict$`Variable name`[idx]
  responses <- data[ var_names ] 
  if( !is.na(dict$Subquestion[ idx[1] ]) ){
    # remove square brackets at beginning and end, then rename columns:
    colnames( responses ) <- str_extract( dict$Subquestion[idx], '(?<=\\[)[^{}]+(?=\\])')
    if( "Other" %in% colnames( responses )){
      responses <- responses %>% select(-Other)
    }
    df <- cbind( Region = data$Region, responses) %>% 
      pivot_longer(!Region, names_to="Arbovirus", values_to="Response") %>% 
      drop_na(Region) %>% 
      group_by(Region, Arbovirus, Response) %>% 
      tally %>% 
      pivot_wider( names_from=Response, values_from=n) 
  } else{
    colnames( responses ) <- "Response"
    df <- data.frame(Region = data$Region, Response = responses) %>% 
      drop_na(Region) %>% 
      group_by(Region, Response) %>% 
      tally %>% 
      pivot_wider(names_from=Response, values_from=n) %>%
      adorn_totals() 
  }
  return( df )
}

#' Responses standardizer
#' @description Function for tabulation of responses by country
#' @return A dataframe
#' @noRd
get_country_table <- function( question_number ){
  # NOTE: Should only have to load data once!
  load("data/data.RData")
  # NOTE: We should only have to read each CSV once!
  dict <- read_csv("misc/Data_dictionary_Survey375147.csv")
  idx <- which( dict$`Question number` == question_number )
  var_names <- dict$`Variable name`[idx]
  responses <- data[ var_names ] 
  if( !is.na(dict$Subquestion[ idx[1] ]) ){
    # remove square brackets at beginning and end, then rename columns:
    colnames( responses ) <- str_extract( dict$Subquestion[idx], '(?<=\\[)[^{}]+(?=\\])')
    if( "Other" %in% colnames( responses )){
      responses <- responses %>% select(-Other)
    }
    df <- responses %>% 
      pivot_longer(everything(), names_to="Arbovirus", values_to="Response") %>% 
      group_by(Arbovirus, Response) %>% 
      tally %>% 
      pivot_wider( names_from=Response, values_from=n) 
  } else{
    colnames( responses ) <- "Response"
    df <- responses %>% 
      group_by(Response) %>% 
      tally %>% 
      pivot_wider(names_from=Response, values_from=n) 
  }
  return( df )
}

#' Responses standardizer
#' @description Function for preparing regional responses for geom_col
#' @return A dataframe
#' @noRd
get_region_plot_df <- function( question_number ){
  # NOTE: Should only have to load data once!
  load("data/data.RData")
  # NOTE: We should only have to read each CSV once!
  dict <- read_csv("misc/Data_dictionary_Survey375147.csv")
  idx <- which( dict$`Question number` == question_number )
  var_names <- dict$`Variable name`[idx]
  responses <- data[ var_names ] 
  if( !is.na(dict$Subquestion[ idx[1] ]) ){
    # remove square brackets at beginning and end, then rename columns:
    colnames( responses ) <- str_extract( dict$Subquestion[idx], '(?<=\\[)[^{}]+(?=\\])')
    if( "Other" %in% colnames( responses )){
      responses <- responses %>% select(-Other)
    }
    df <- cbind( Region = data$Region, responses) %>% 
      pivot_longer(!Region, names_to="Arbovirus", values_to="Response") %>% 
      drop_na(Region) %>% 
      group_by(Region, Arbovirus, Response) %>% 
      tally 
  } else{
    colnames( responses ) <- "Response"
    df <- data.frame(Region = data$Region, Response = responses) %>% 
      drop_na(Region) %>% 
      group_by(Region, Response) %>% 
      tally 
  }
  return( df )
}

#' Responses standardizer
#' @description Function for preparing country level responses for geom_col
#' @return A dataframe
#' @noRd
get_country_plot_df <- function( question_number ){
  # NOTE: Should only have to load data once!
  load("data/data.RData")
  # NOTE: We should only have to read each CSV once!
  dict <- read_csv("misc/Data_dictionary_Survey375147.csv")
  idx <- which( dict$`Question number` == question_number )
  var_names <- dict$`Variable name`[idx]
  responses <- data[ var_names ] 
  if( !is.na(dict$Subquestion[ idx[1] ]) ){
    # remove square brackets at beginning and end, then rename columns:
    colnames( responses ) <- str_extract( dict$Subquestion[idx], '(?<=\\[)[^{}]+(?=\\])')
    if( "Other" %in% colnames( responses )){
      responses <- responses %>% select(-Other)
    }
    df <- responses %>% 
      pivot_longer(everything(), names_to="Arbovirus", values_to="Response") %>% 
      group_by(Arbovirus, Response) %>% 
      tally 
  } else{
    colnames( responses ) <- "Response"
    df <- responses %>%  
      group_by(Response) %>% 
      tally 
  }
  return( df )
}


#' Make random colors palette
#' @description Function for making colors
#' @return A vector
#' @noRd
#' @import RColorBrewer
make_colors <- function(n, seed = 123){
  pal <- RColorBrewer::brewer.pal(n = 9, name = 'Set1')
  set.seed(seed)
  pal <- sample(pal, length(pal))
  out <- colorRampPalette(pal)(n)
  return(out)
}

