library(tidyverse)
library(stringr)
library(pander)
library(knitr)
library(flextable)
library(lubridate)

load_data <- function(){
  # Read in data
  owd <- getwd()
  setwd('../')
  if( file.exists("data/data.RData")){
    load("data/data.RData")
  } else{
    message("You need the data!")
  }
  # data <- data %>% dplyr::filter( SI01 == params$country )
  if( file.exists("misc/Data_dictionary_Survey375147_unabridged.csv")){
    dict <- read_csv("misc/Data_dictionary_Survey375147_unabridged.csv")
  } else{
    message("You need the data dictionary!")
  }
  setwd(owd)
  
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
  
  
  df <- data[,dict$`Variable name`[dict$`Question number` %in% c('11', '11b',
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
                                                                 '56')]]
  return(df)
}

# rmarkdown::render('region.Rmd')
# rmarkdown::render('country.Rmd')
# rmarkdown::render('about.Rmd')
