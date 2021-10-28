library(tidyverse)
library(readxl)
library(stringr)
library(pander)
library(knitr)
# library(flextable)
# library(RColorBrewer)
# library(janitor)

##########################
# Load the survey results
##########################

if( file.exists("data/data.RData")){
  load("data/data.RData")
} else{
  message("You need the data!")
}

if( file.exists("data/Data_dictionary_Survey375147.csv")){
  dict <- read_csv("data/Data_dictionary_Survey375147.csv")
} else{
  message("You need the data dictionary!")
}

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

idx <- which( is.na( dict$`Question number` )) 
          # which( grepl('upload', dict$`Type of variable`)),
          # which ( grepl('filecount', dict$`Question number`) ))
all_questions <- dict$`Question number`[-idx]
idx <- which( all_questions == "1" )
all_questions <- unique( all_questions[ idx:length( all_questions )] )
n_questions <- length( all_questions )
    
write_lines("---
title: \"Arboviral Surveillance and Response Capacity Survey 2021\"
output: html_document
params:
  country: \"Germany\"
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
# options(scipen = '999')
```

```{r}

library(tidyverse)
library(stringr)
library(pander)
library(knitr)
library(flextable)
library(lubridate)

if( file.exists(\"data/data.RData\")){
  load(\"data/data.RData\")
} else{
  message(\"You need the data!\")
}

data <- data %>% filter( SI01 == params$country )

if( file.exists(\"data/Data_dictionary_Survey375147_unabridged.csv\")){
  dict <- read_csv(\"data/Data_dictionary_Survey375147_unabridged.csv\")
} else{
  message(\"You need the data dictionary!\")
}

# utility function 
get_responses <- function( question_number ){
  idx <- which( dict$`Question number` == question_number )
  var_names <- dict$`Variable name`[idx]
  responses <- data %>% select( all_of(var_names) )
  if( !is.na(dict$Subquestion[ idx[1] ]) ){
    # remove square brackets at beginning and end, then rename columns:
    colnames( responses ) <- str_extract( dict$Subquestion[idx], '(?<=\\\\[)[^{}]+(?=\\\\])')
  } else{
    colnames( responses ) <- \"Response\"
  }
  return( responses )
}
```
", "report.Rmd")
    
for( j in 1:n_questions ){
  num <- all_questions[j]
  idx <- which( dict$`Question number` == num)
  question <- str_trim( dict$Description[idx[1]] )
  write_lines(paste0("\n#### ",num,". ",question,"\n"), 
              "report.Rmd", 
              append=TRUE)
  if( length(idx)==1){
    var_name <- dict$`Variable name`[idx]
    write_lines(paste0("> `r data$",var_name,"` \n\n"), 
                "report.Rmd", 
                append=TRUE)
  } else{
    write_lines(paste0("```{r}\nresponses <- get_responses(\"",num,"\")\n"),
                "report.Rmd",
                append=TRUE)
    write_lines("if( all( grepl(\"\\\\]\\\\[\", colnames(responses)) ) ){
responses <- responses %>% 
\tpivot_longer(everything())
new_cols <- matrix( unlist( strsplit(responses$name, \"\\\\]\\\\[\") ), ncol=2, byrow=T)
responses <- responses %>% 
\tmutate(Level = new_cols[,1], Response = new_cols[,2]) %>% 
\tselect(-name) %>%
\tmutate( value = case_when( value == 1 ~ \"Yes\", is.na(value) ~ \"No\")) %>%
\tpivot_wider(names_from=Response, values_from=value)
} else{
responses <- responses %>% pivot_longer( everything() )
}
knitr::kable(responses, col.names=NULL)\n```\n\n",
    "report.Rmd",
    append=TRUE)
  }
}
