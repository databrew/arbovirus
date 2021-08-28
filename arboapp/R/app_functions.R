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

#' Responses standardizer
#' @description Function for processing responses
#' @return A dataframe
#' @noRd
get_responses <- function( question_number ){
  idx <- which( dict$`Question number` == question_number )
  # question <- dict$Description[ idx[1] ]
  # cat( paste("Question", question_number, ":", question) )
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

