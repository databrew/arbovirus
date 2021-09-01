library(tidyverse)
library(readxl)
library(stringr)
library(pander)
# library(flextable)
# library(RColorBrewer)
# library(janitor)

write_lines("---
title: \"WHO Global Arbovirus Survey\"
output: html_document
---

```{r setup, include=FALSE, echo = FALSE}
# Basic knitr options
library(knitr)
opts_chunk$set(comment = NA, 
               echo = FALSE,
               warning = FALSE, 
               message = FALSE, 
               error = TRUE, 
               cache = FALSE,
               fig.width = 9.64,
               fig.height = 5.9,
               fig.path = 'figures/')
options(scipen = '999')
```
", "reports.Rmd")

# get the survey results:

if( file.exists("data/data.RData")){
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

data <- data %>% filter(SI01 == params$country)

# load data dictionary to facilitate processing survey results:
dict <- read_csv("misc/Data_dictionary_Survey375147.csv")

# utility function 
get_responses <- function( question_number ){
  idx <- which( dict$`Question number` == question_number )
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

# write_lines("Survey submitted on",data$SI04),"reports/reports.Rmd", append=TRUE)
# write_lines(paste("by",data$SI02, data$SI03),"reports/reports.Rmd", append=TRUE)

idx <- c( which( is.na( dict$`Question number` )),
          which( grepl('upload', dict$`Type of variable`)),
          which ( grepl('filecount', dict$`Question number`) ))
all_questions <- dict$`Question number`[-idx]
idx <- which( all_questions == "1" )
all_questions <- unique( all_questions[ idx:length( all_questions )] )
n_questions <- length( all_questions )
for( i in 1:n_questions ){
  num <- all_questions[i]
  idx <- min( which( dict$`Question number` == num))
  question <- dict$Description[idx]
  write_lines(paste("####",num, question,"\n"), "reports.Rmd", append=TRUE)
}
