#' Data read in
#' @description Function for reading in data
#' @return A dataframe
#' @noRd
#' @import tidyverse
load_data <- function(){
  message('function: load_data')
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
#' @import readr
load_dict <- function(){
  message('function: load_dict')
  read_csv("misc/Data_dictionary_Survey375147.csv")
}

#' Questions standardizer
#' @description Function for retrieving question numbers
#' @return A character vector
#' @noRd
#' @import tidyverse
get_questions <- function( ){
  message('function: get_questions')
  # NOTE: We should only have to read each CSV once!
  dict <- read_csv("misc/Data_dictionary_Survey375147.csv", show_col_types = FALSE)
  idx <- c( which( is.na( dict$`Question number` )),
            which( grepl('upload', dict$`Type of variable`)),
            which ( grepl('filecount', dict$`Question number`) ))
  questions <- dict$`Question number`[-idx]
  idx <- which( questions == "5" )[1]
  questions <- unique( questions[ idx:length( questions )] )
  return( questions )
}

#' Questions standardizer
#' @description Function for retrieving question text
#' @return A character string
#' @noRd
#' @import tidyverse
get_question_text <- function( question_number ){
  message('function: get_question_text')
  # NOTE: We should only have to read each CSV once!
  dict <- read_csv("misc/Data_dictionary_Survey375147.csv", show_col_types = FALSE)
  vec <- which( dict$`Question number` == question_number )
  ok <- FALSE
  if(length(vec) > 0){
    ok <- TRUE
  }
  if(ok){
    idx <- min(vec)
    question_text <- dict$Description[ idx ]
    return( question_text )
  } else {
    return(' ')
  }

}

#' Responses standardizer
#' @description Function for retrieving responses to a given question
#' @return A dataframe
#' @noRd
#' @import tidyverse
get_responses <- function( question_number ){
  message('function: get_responses')
  # NOTE: We should only have to read each CSV once!
  dict <- read_csv("misc/Data_dictionary_Survey375147.csv")
  idx <- which( dict$`Question number` == question_number )[1]
  var_names <- dict$`Variable name`[idx]
  responses <- data[ var_names ] 
  if(ncol(responses) > 0){
    if( !is.na(dict$Subquestion[ idx[1] ]) ){
      # remove square brackets at beginning and end, then rename columns:
      sub_question <- dict$Subquestion[idx]
      if(is.na(sub_question) | nchar(sub_question) < 2){
        sub_question <- dict$Description[idx]
      }
      colnames( responses ) <- str_extract( sub_question, '(?<=\\[)[^{}]+(?=\\])')
    } else{
      colnames( responses ) <- "Response"
    }
  }
  
  return( responses )
}

#' Regions standardizer
#' @description Function for retrieving WHO region names
#' @return A character vector
#' @noRd
#' @import tidyverse
get_regions <- function( ){
  message('function: get_regions')
  # NOTE: We should only have to load data once!
  load("data/data.RData")
  regions <- levels( data$Region )
  return( regions )
}

#' Responses standardizer
#' @description Function for tabulation of responses by region
#' @return A dataframe
#' @noRd
#' @import tidyverse
get_region_table <- function( question_number ){
  if(!is.null(question_number)){
    message('function: get_region_table. question_number = ', question_number)
    # NOTE: Should only have to load data once!
    load("data/data.RData")
    # NOTE: We should only have to read each CSV once!
    dict <- read_csv("misc/Data_dictionary_Survey375147.csv")
    idx <- which( dict$`Question number` == question_number )[1]
    var_names <- dict$`Variable name`[idx]
    responses <- data[ var_names ] 
    if(ncol(responses) > 0){
      if( !is.na(dict$Subquestion[ idx[1] ]) ){
        # remove square brackets at beginning and end, then rename columns:
        sub_question <- dict$Subquestion[idx]
        sub_question <- str_extract( sub_question, '(?<=\\[)[^{}]+(?=\\])')
        if(is.na(sub_question) | nchar(sub_question) < 2){
          sub_question <- dict$Description[idx]
        }
        colnames( responses ) <- sub_question
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
  }
}

#' Responses standardizer
#' @description Function for tabulation of responses by country
#' @return A dataframe
#' @noRd
#' @import tidyverse
get_country_table <- function( question_number ){
  message('function: get_country_table. question_number: ', question_number)
  if(!is.null(question_number)){
    # NOTE: Should only have to load data once!
    load("data/data.RData")
    # NOTE: We should only have to read each CSV once!
    dict <- read_csv("misc/Data_dictionary_Survey375147.csv")
    idx <- which( dict$`Question number` == question_number )[1]
    var_names <- dict$`Variable name`[idx]
    responses <- data[ var_names ] 
    if(ncol(responses) > 0){
      if( !is.na(dict$Subquestion[ idx[1] ]) ){
        # remove square brackets at beginning and end, then rename columns:
        sub_question <- dict$Subquestion[idx]
        sub_question <- str_extract( sub_question, '(?<=\\[)[^{}]+(?=\\])')
        if(is.na(sub_question) | nchar(sub_question) < 2){
          sub_question <- dict$Description[idx]
        }
        colnames( responses ) <- sub_question
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
  }
}

#' Responses standardizer
#' @description Function for preparing regional responses for geom_col
#' @return A dataframe
#' @noRd
#' @import tidyverse
get_region_plot_df <- function( question_number ){
  message('function: get_region_plot_df. question_number: ', question_number)
  if(!is.null(question_number)){
    # NOTE: Should only have to load data once!
    message('---loading data')
    load("data/data.RData")
    # NOTE: We should only have to read each CSV once!
    dict <- read_csv("misc/Data_dictionary_Survey375147.csv")
    idx <- which( dict$`Question number` == question_number )[1]
    var_names <- dict$`Variable name`[idx]
    responses <- data[ var_names ] 
    if(ncol(responses) > 0){
      if( !is.na(dict$Subquestion[ idx[1] ]) ){
        # remove square brackets at beginning and end, then rename columns:
        sub_question <- dict$Subquestion[idx]
        sub_question <- str_extract( sub_question, '(?<=\\[)[^{}]+(?=\\])')
        if(is.na(sub_question) | nchar(sub_question) < 2){
          sub_question <- dict$Description[idx]
        }
        colnames( responses ) <- sub_question
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
  }
  
}

#' Responses standardizer
#' @description Function for preparing country level responses for geom_col
#' @return A dataframe
#' @noRd
#' @import tidyverse
get_country_plot_df <- function( question_number ){
  message('function: get_country_plot_df. question_number: ', question_number)
  if(!is.null(question_number)){
    # NOTE: Should only have to load data once!
    load("data/data.RData")
    # NOTE: We should only have to read each CSV once!
    dict <- read_csv("misc/Data_dictionary_Survey375147.csv")
    idx <- which( dict$`Question number` == question_number )[1]
    var_names <- dict$`Variable name`[idx]
    responses <- data[ var_names ] 
    if(ncol(responses) > 0){
      if( !is.na(dict$Subquestion[ idx[1] ]) ){
        # remove square brackets at beginning and end, then rename columns:
        sub_question <- dict$Subquestion[idx]
        sub_question <- str_extract( sub_question, '(?<=\\[)[^{}]+(?=\\])')
        if(is.na(sub_question) | nchar(sub_question) < 2){
          sub_question <- dict$Description[idx]
        }
        colnames( responses ) <- sub_question
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
  }
  
}


#' Make random colors palette
#' @description Function for making colors
#' @return A vector
#' @noRd
#' @import RColorBrewer
make_colors <- function(n, seed = 123){
  message('function: make_colors')
  pal <- RColorBrewer::brewer.pal(n = 9, name = 'Set1')
  set.seed(seed)
  pal <- sample(pal, length(pal))
  out <- colorRampPalette(pal)(n)
  return(out)
}

