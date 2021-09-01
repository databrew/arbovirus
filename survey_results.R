---
title: "WHO Global Arbovirus Survey"
author: "Survey results"
date: "`r format(Sys.time(), '%Y %B %d')`"
output: html_document
params:
  country: "Afghanistan"
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

```{r}

library(tidyverse)
library(readxl)
library(flextable)
library(stringr)
library(pander)
library(RColorBrewer)
library( janitor )
make_colors <- function(n, seed = 123){
  pal <- RColorBrewer::brewer.pal(n = 9, name = 'Set1')
  set.seed(seed)
  pal <- sample(pal, length(pal))
  out <- colorRampPalette(pal)(n)
  return(out)
}
ggplot2::theme_set(theme_bw())

# get the survey results: processed by WHO script (lightly edited),
# then WHO regions added

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

# Create report for selected country only:
data <- data %>%
  filter( SI01 == params$country )

# load data dictionary to facilitate processing survey results:
dict <- read_csv("misc/Data_dictionary_Survey375147.csv")

# utility function 
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

```

# Submission information

Survey submitted on `r data$SI04`

by `r data$SI02`, `r data$SI03`

```{r}

start <- which( dict$`Question number` == 1 )
stop <- length( dict$`Question number`)
(question_nums <- unique( dict$`Question number`[start:stop]))

```
