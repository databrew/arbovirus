library(dplyr)
library(tidyr)
library(ggplot2)
library(Hmisc)
library(RColorBrewer)
library(scales)
library(leaflet)
library(leaflet.extras)
library(readr)
library(readxl)

#############################################
# WHO profided shapefiles
#############################################
# Read in WHO shapefiles
if('who_shp.RData' %in% dir("data")){
  load('data/who_shp.RData')
} else {
  library(whomapper) # https://github.com/whocov/whomapper
  # options(scipen = '999')
  who_shp <- whomapper::pull_who_adm0()
  save(who_shp, file = 'data/who_shp.RData')
}
# Source WHO provided function for mapping
source('dashboard/who_map_disp.R')

#############################################
# Other shape files
#############################################
load('data/world_shp.rda') # load world shape file
load('data/region_shp.rda') # load region shape file

#############################################
# Load up data from initial survey (non-PAHO)
#############################################
# load data dictionary to facilitate processing survey results:
dict <- read_csv("data/Data_dictionary_Survey375147.csv")

# get the survey results: processed by WHO script (lightly edited),
# then WHO regions added

if( file.exists("data/data.RData") ){
  load("data/data.RData")
} else{
  source("data/survey_375147_R_syntax_file.R")
  n_countries <- length( data$SI01 )
  who_regions <- read_csv("data/Regions_Countries.csv")
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
  
  # add _indirect detection_ and _direct detection_ variables to simplify summary of question 17:
  idx <- which( dict$`Question number` == "17" )
  var_names <- dict$`Variable name`[idx]
  q17 <- data %>% select( all_of(var_names) )
  colnames( q17 ) <- str_extract( dict$Subquestion[idx], '(?<=\\[)[^{}]+(?=\\])')
  for(i in 1:ncol(q17)){
    q17[,i] <- as.logical( as.numeric( as.character( q17[,i] )))
  }
  indirect <- cbind( q17[,2] | q17[,3] | q17[,4],     # Chikungunya 
                     q17[,9] | q17[,10] | q17[,11],   # Dengue 
                     q17[,16] | q17[,17] | q17[,18],  # Yellow fever 
                     q17[,23] | q17[,24] | q17[,25],  # Zika
                     q17[,30] | q17[,31] | q17[,32] ) # other 
  
  colnames( indirect ) <- c( "Chikungunya][Indirect",
                             "Dengue][Indirect",
                             "Yellow fever][Indirect",
                             "Zika][Indirect",
                             "Other][Indirect")
  
  direct <- cbind( q17[,1] | q17[,5] | q17[,6] | q17[,7], # Chikungunya
                   q17[,8] | q17[,12] | q17[,13] | q17[,14], # Dengue
                   q17[,15] | q17[,19] | q17[,20] | q17[,21], # Yellow fever
                   q17[,22] | q17[,26] | q17[,27] | q17[,28], # Zika
                   q17[,29] | q17[,33] | q17[,34] | q17[,35] ) # other
  
  colnames( direct ) <- c( "Chikungunya][Direct",
                           "Dengue][Direct",
                           "Yellow fever][Direct",
                           "Zika][Direct",
                           "Other][Direct")
  
  both_methods <- cbind( indirect[,1] & direct[,1],
                         indirect[,2] & direct[,2],
                         indirect[,3] & direct[,3],
                         indirect[,4] & direct[,4],
                         indirect[,5] & direct[,5])
  colnames( both_methods ) <- c("Chikungunya][Both",
                                "Dengue][Both",
                                "Yellow fever][Both", 
                                "Zika][Both",
                                "Other][Both")
  
  one_method <- cbind( indirect[,1] != direct[,1],
                       indirect[,2] != direct[,2],
                       indirect[,3] != direct[,3],
                       indirect[,4] != direct[,4],
                       indirect[,5] != direct[,5])
  colnames( one_method ) <- c( "Chikungunya][One",
                               "Dengue][One",
                               "Yellow fever][One",
                               "Zika][One",
                               "Other][One")
  
  neither_method <- cbind( !indirect[,1] & !direct[,1],
                           !indirect[,2] & !direct[,2],
                           !indirect[,3] & !direct[,3],
                           !indirect[,4] & !direct[,4],
                           !indirect[,5] & !direct[,5])
  
  colnames( neither_method ) <- c( "Chikungunya][Neither",
                                   "Dengue][Neither",
                                   "Yellow fever][Neither",
                                   "Zika][Neither",
                                   "Other][Neither")
  
  for(i in 1:ncol(indirect)){
    indirect[,i] = ifelse( indirect[,i], "Yes", "No")
  }
  for(i in 1:ncol(direct)){
    direct[,i] = ifelse( direct[,i], "Yes", "No")
  }
  for(i in 1:ncol(both_methods)){
    both_methods[,i] = ifelse( both_methods[,i], "X", NA)
  }
  for(i in 1:ncol(one_method)){
    one_method[,i] = ifelse( one_method[,i], "X", NA)
  }
  for(i in 1:ncol(neither_method)){
    neither_method[,i] = ifelse( neither_method[,i], "X", NA)
  }
  data <- cbind( data, indirect, direct, both_methods, one_method, neither_method )
  
  save(data, file="data/data.RData")
}

# Iceland is for testing purposes only; remove for analysis:
data <- data %>%
  filter( SI01 != "Iceland")

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

source('dashboard/functions.R')

# Define WHO regions
who_regions <- who_shp$adm0

#############################################
# Read in PAHO data
#############################################
if('combined_data.RData' %in% dir("data")){
  load('data/combined_data.RData')
} else {
  
  # https://trello.com/c/LgyKpQfk/2696-who-new-dataset-combination
  pahoxl <- read_excel('data/Copia_de_PAHO_key_indicator_spreadsheet_19_Nov_2021-Completo.xlsx', skip = 1)
  # Transform
  ph <- tidyr::gather(pahoxl %>% dplyr::rename(variable = Country),
                      key = country, 
                      value,
                      Canada:`Virgin Islands (US)`)
  ph <- tidyr::spread(data = ph,
                      key = variable,
                      value = value)
  # Standardize country names to match WHO shapefiles
  # ph$country <- toupper(ph$country)
  ph$country[!ph$country %in% who_regions$adm0_viz_n]
  ph$country <- dplyr::recode(ph$country,
                              'Bolivia' = 'Bolivia (Plurinational State of)',
                              'Bonaire, Saint Eustatius and Saba' = 'Bonaire',
                              'Saint Barthelemy' = 'Saint Barthélemy',
                              
                              'Venezuela' = 'Venezuela (Bolivarian Republic of)',
                              'Virgin Islands (UK)' = 'British Virgin Islands',
                              'Virgin Islands (US)' = 'United States Virgin Islands')
  ph$adm0_name <- toupper(ph$country)
  # ph$country[!ph$country %in% who_regions$adm0_viz_n] # length = 0; all good
  paho <- ph
  
  # Now there are two important datasets
  # 1. paho (the paho data, which needs to be changed to the format of...)
  # 2. data (the main, original dataset)
  
  original_paho_names <- names(paho)
  
  
  #############################################
  # Go variable by variable and update the paho data
  #############################################
  # country
  # SI01
  paho$SI01 <- paho$country
  
  # Any CHIKV circulation since 2000? [Y/N]
  paho$SII05_SQ001 <- ifelse(paho$`Any CHIKV circulation since 2000? [Y/N]` == 'Y', 'Yes', 'Not selected')
  
  # Any DENV circulation since 2000? [Y/N]
  paho$SII05_SQ002 <- ifelse(paho$`Any DENV circulation since 2000? [Y/N]` == 'Y',
                             'Yes', 'Not selected')
  
  # Any YFV circulation since 2000? [Y/N]
  paho$SII05_SQ003 <- ifelse(paho$`Any YFV circulation since 2000? [Y/N]` == 'Y',
                             'Yes', 'Not selected')
  
  # Any ZIKV circulation since 2000? [Y/N]
  paho$SII05_SQ004 <- ifelse(paho$`Any ZIKV circulation since 2000? [Y/N]` == 'Y',
                             'Yes', 'Not selected')
  
  # Arboviral disease surveillance data
  # No responses, so no conversion
  
  # Arboviral disease surveillance system
  # No responses, so no conversion
  
  # Arbovirus laboratory capacity
  # No responses, so no conversion
  
  # Arbovirus virological surveillance on human specimens
  # No responses, so no conversion
  
  # Are concurrent human cases used for threshold(s)? [Y/N]
  paho$SV37b_SQ001 <- ifelse(paho$`Are concurrent human cases used for threshold(s)? [Y/N]` == 'Y', 'Yes', 'Not selected')
  
  # Are data on Beteau Index routinely collected and analysed? [Y/N]
  paho$SV38_SQ002 <- ifelse(paho$`Are data on Beteau Index routinely collected and analysed? [Y/N]` == 'Y', 'Yes', 'Not selected')
  
  # Are data on container indices routinely collected and analysed? [Y/N]
  paho$SV38_SQ003 <- ifelse(paho$`Are data on container indices routinely collected and analysed? [Y/N]` == 'Y', 'Yes', 'Not selected')
  
  # Are data on house index routinely collected and analysed? [Y/N]
  paho$SV38_SQ001 <- ifelse(paho$`Are data on house index routinely collected and analysed? [Y/N]` == 'Y', 'Yes', 'Not selected')
  
  # Are data on migration of non-immune populations routinely collected and analysed? [Y/N]
  paho$SV38_SQ006 <- ifelse(paho$`Are data on migration of non-immune populations routinely collected and analysed? [Y/N]` == 'Y', 'Yes', 'Not selected')
  
  
  # Are data on rainfall routinely collected and analysed? [Y/N]
  paho$SV38_SQ005 <- ifelse(paho$`Are data on rainfall routinely collected and analysed? [Y/N]` == 'Y', 'Yes', 'Not selected')
  
  # Are data on temperature routinely collected and analysed? [Y/N]
  paho$SV38_SQ004 <- ifelse(paho$`Are data on temperature routinely collected and analysed? [Y/N]` == 'Y', 'Yes', 'Not selected')
  
  # Are minimum infection rates used for threshold(s)? [Y/N]
  paho$SV37b_SQ002 <- ifelse(paho$`Are minimum infection rates used for threshold(s)? [Y/N]` == 'Y', 'Yes', 'Not selected')
  
  # Are regular training sessions held for healthcare workers on clinical diagnosis and management of Aedes-borne arboviral diseases? [Y/N]
  # paho$`Are regular training sessions held for healthcare workers on clinical diagnosis and management of Aedes-borne arboviral diseases? [Y/N]`
  # (skipping because all NA)
  
  # Are there clinical guidelines for healthcare workers on diagnosis and clinical management of cases and severe cases of Aedes-borne arboviral diseases? [Y/N]
  paho$SIV21 <- ifelse(paho$`Are there clinical guidelines for healthcare workers on diagnosis and clinical management of cases and severe cases of Aedes-borne arboviral diseases? [Y/N]` == 'Y', 'Yes', 'No')
  
  # Are there written national arbovirus surveillance and control plan(s) and/or guideline(s)? [Y/N]
  paho$SII06 <- ifelse(paho$`Are there written national arbovirus surveillance and control plan(s) and/or guideline(s)? [Y/N]` == 'Y', 'Yes, we have arbovirus-specific plans(s) or guidelines(s)', 'No')
  
  # CHIKV 2015 Cases
  paho$SIX55_SQ002_SQ001 <- as.numeric(paho$`CHIKV 2015 Cases`)
  # CHIKV 2015 Deaths
  paho$SIX55_SQ002_SQ002 <- as.numeric(paho$`CHIKV 2015 Deaths`)
  # CHIKV 2016 Cases
  paho$SIX55_SQ002_SQ003 <- as.numeric(paho$`CHIKV 2016 Cases`)
  # CHIKV 2016 Deaths
  paho$SIX55_SQ002_SQ004 <- as.numeric(paho$`CHIKV 2016 Deaths`)
  # CHIKV 2017 Cases
  paho$SIX55_SQ002_SQ005 <- as.numeric(paho$`CHIKV 2017 Cases`)
  # CHIKV 2017 Deaths
  paho$SIX55_SQ002_SQ006 <- as.numeric(paho$`CHIKV 2017 Deaths`)
  # CHIKV 2018 Cases
  paho$SIX55_SQ002_SQ007 <- as.numeric(paho$`CHIKV 2018 Cases`)
  # CHIKV 2018 Deaths
  paho$SIX55_SQ002_SQ008 <- as.numeric(paho$`CHIKV 2018 Deaths`)
  # CHIKV 2019 Cases
  paho$SIX55_SQ002_SQ010 <- as.numeric(paho$`CHIKV 2019 Cases`)
  # CHIKV 2019 Deaths
  paho$SIX55_SQ002_SQ009 <- as.numeric(paho$`CHIKV 2019 Deaths`)
  # CHIKV 2020 Cases
  paho$SIX55_SQ002_SQ011 <- as.numeric(paho$`CHIKV 2020 Cases`)
  # CHIKV 2020 Confirmed cases
  paho$SIX56_SQ002_SQ003 <- as.numeric(paho$`CHIKV 2020 Confirmed cases`)
  # CHIKV 2020 Deaths
  paho$SIX55_SQ002_SQ012 <- as.numeric(paho$`CHIKV 2020 Deaths`)
  # CHIKV 2020 Probable cases
  paho$SIX56_SQ002_SQ002 <- as.numeric(paho$`CHIKV 2020 Probable cases`)
  # CHIKV 2020 Suspect cases
  paho$SIX56_SQ002_SQ001 <- as.numeric(paho$`CHIKV 2020 Suspect cases`)
  
  # DENV 2015 Cases
  paho$SIX55_SQ001_SQ001 <- as.numeric(paho$`DENV 2015 Cases`)
  # DENV 2015 Deaths
  paho$SIX55_SQ001_SQ002 <- as.numeric(paho$`DENV 2015 Deaths`)
  # DENV 2016 Cases
  paho$SIX55_SQ001_SQ003 <- as.numeric(paho$`DENV 2016 Cases`)
  # DENV 2016 Deaths
  paho$SIX55_SQ001_SQ004 <- as.numeric(paho$`DENV 2015 Deaths`)
  # DENV 2017 Cases
  paho$SIX55_SQ001_SQ005 <- as.numeric(paho$`DENV 2017 Cases`)
  # DENV 2017 Deaths
  paho$SIX55_SQ001_SQ006 <- as.numeric(paho$`DENV 2015 Deaths`)
  # DENV 2018 Cases
  paho$SIX55_SQ001_SQ007 <- as.numeric(paho$`DENV 2018 Cases`)
  # DENV 2018 Deaths
  paho$SIX55_SQ001_SQ008 <- as.numeric(paho$`DENV 2015 Deaths`)
  # DENV 2019 Cases
  paho$SIX55_SQ001_SQ010 <- as.numeric(paho$`DENV 2019 Cases`)
  # DENV 2019 Deaths
  paho$SIX55_SQ001_SQ009 <- as.numeric(paho$`DENV 2015 Deaths`)
  # DENV 2020 Cases
  paho$SIX55_SQ001_SQ011 <- as.numeric(paho$`DENV 2020 Cases`)
  # DENV 2020 Confirmed cases
  paho$SIX56_SQ004_SQ003 <- as.numeric(paho$`DENV 2020 Confirmed cases`)
  # DENV 2020 Deaths
  paho$SIX56_SQ004_SQ004 <- as.numeric(paho$`DENV 2020 Deaths`)
  
  # # DENV 2020 Probable cases
  # as.numeric(paho$`DENV 2020 Probable cases`) # skipping all NA
  
  # # DENV 2020 Suspect cases
  # as.numeric(paho$`DENV 2020 Suspect cases`) # skipping, all NA
  
  # YFV 2015 Cases
  paho$SIX55_SQ003_SQ001 <- as.numeric(paho$`YFV 2015 Cases`)
  
  # YFV 2015 Deaths
  paho$SIX55_SQ003_SQ002 <- as.numeric(paho$`YFV 2015 Deaths`)
  
  # YFV 2016 Cases
  paho$SIX55_SQ003_SQ003 <- as.numeric(paho$`YFV 2016 Cases`)
  
  # YFV 2016 Deaths
  paho$SIX55_SQ003_SQ004 <- as.numeric(paho$`YFV 2016 Deaths`)
  
  # YFV 2017 Cases
  paho$SIX55_SQ003_SQ005 <- as.numeric(paho$`YFV 2017 Cases`)
  
  # YFV 2017 Deaths
  paho$SIX55_SQ003_SQ006 <- as.numeric(paho$`YFV 2017 Deaths`)
  
  # YFV 2018 Cases
  paho$SIX55_SQ003_SQ007 <- as.numeric(paho$`YFV 2018 Cases`)
  
  # YFV 2018 Deaths
  paho$SIX55_SQ003_SQ008 <- as.numeric(paho$`YFV 2018 Deaths`)
  
  # YFV 2019 Cases
  paho$SIX55_SQ003_SQ010 <- as.numeric(paho$`YFV 2019 Cases`)
  
  # YFV 2019 Deaths
  paho$SIX55_SQ003_SQ009 <- as.numeric(paho$`YFV 2019 Deaths`)
  
  # YFV 2020 Cases
  paho$SIX55_SQ003_SQ011 <- as.numeric(paho$`YFV 2020 Cases`)
  
  # YFV 2020 Confirmed cases
  paho$SIX56_SQ003_SQ003 <- as.numeric(paho$`YFV 2020 Confirmed cases`)
  
  # YFV 2020 Deaths
  paho$SIX55_SQ003_SQ012 <- as.numeric(paho$`YFV 2020 Deaths`)
  
  # Conducted national epidemiological surveillance for human cases of arboviral disease in last 2 years? [Y/N]
  paho$SII12 <- ifelse(paho$`Conducted national epidemiological surveillance for human cases of arboviral disease in last 2 years? [Y/N]` == 'Y', 'Yes', 'No')
  
  # During the last 2 years, was national epidemiological surveillance for arboviral disease conducted in animals (eg, epizootic surveillance for yellow fever in endemic areas)? [Y/N]
  paho$SVI41 <- ifelse(paho$`During the last 2 years, was national epidemiological surveillance for arboviral disease conducted in animals (eg, epizootic surveillance for yellow fever in endemic areas)? [Y/N]` == 'Y', 'Yes', 'No')
  
  # For the last 2 years, was there entomologic surveillance for arboviruses in mosquito vectors? [Y/N]
  paho$SV28 <- ifelse(paho$`For the last 2 years, was there entomologic surveillance for arboviruses in mosquito vectors? [Y/N]` == 'Y', 'Yes', 'No')
  
  # How often was the surveillance conducted? [dropdown]
  paho$SV28e <- paho$`How often was the surveillance conducted? [dropdown]`
  
  # If using other nucleic acid tests, which tests? [text]
  # all NA, skipping
  
  # If using serological testing, which tests? [text]
  # all NA skipping
  
  # In the past two years, did the country conduct adulticiding (insecticide application against adult mosquitoes)? [Y/N]
  paho$SV35_SQ001 <- ifelse(paho$`In the past two years, did the country conduct adulticiding (insecticide application against adult mosquitoes)? [Y/N]` == 'Y', 'Yes', 'Not selected')
  
  # In the past two years, did the country conduct larviciding? [Y/N]
  paho$SV35_SQ002 <- ifelse(paho$`In the past two years, did the country conduct larviciding? [Y/N]` == 'Y', 'Yes', 'Not selected')
  
  convert_y <- function(x){ifelse(x == 'Y', 'Yes', 'Not selected')}
  convert_y_numeric <- function(x){ifelse(x == 'Y', 1, 0)}
  
  # In the past two years, did the country use insect growth regulators (eg , pyriproxyfen)? [Y/N]
  paho$SV35_SQ003 <- convert_y(paho$`In the past two years, did the country use insect growth regulators (eg , pyriproxyfen)? [Y/N]`)
  
  # In the past two years, did the country use sterile insect release? [Y/N]
  paho$SV35_SQ005 <- convert_y(paho$`In the past two years, did the country use sterile insect release? [Y/N]`)
  
  # In the past two years, did the country use Wolbachia? [Y/N]
  paho$SV35_SQ004 <- convert_y(paho$`In the past two years, did the country use Wolbachia? [Y/N]`)
  
  # Is CHIKV IgG available? [Y/N]
  paho$SIII17_SQ001_SQ007 <- convert_y(paho$`Is CHIKV IgG available? [Y/N]`)
  
  # Is CHIKV IgM available? [Y/N]
  paho$SIII17_SQ001_SQ002 <- ifelse(paho$`Is CHIKV IgM available? [Y/N]` == 'Y', 1, 0)
  
  # Is CHIKV neutralizing antibody testing available? [Y/N]
  paho$SIII17_SQ001_SQ003 <- convert_y(paho$`Is CHIKV neutralizing antibody testing available? [Y/N]`)
  
  # Is CHIKV PCR available? [Y/N]
  paho$SIII17_SQ001_SQ005 <- convert_y_numeric(paho$`Is CHIKV PCR available? [Y/N]`)
  
  # Is CHIKV virus isolation available? [Y/N]
  paho$SIII17_SQ001_SQ004 <- convert_y(paho$`Is CHIKV virus isolation available? [Y/N]`)
  
  # Is DENV IgG available? [Y/N]
  paho$SIII17_SQ002_SQ007 <- convert_y(paho$`Is DENV IgG available? [Y/N]`)
  # Is DENV IgM available? [Y/N]
  paho$SIII17_SQ002_SQ002 <- convert_y_numeric(paho$`Is DENV IgM available? [Y/N]`)
  # Is DENV neutralizing antibody testing available? [Y/N]
  paho$SIII17_SQ002_SQ003 <- convert_y_numeric(paho$`Is DENV neutralizing antibody testing available? [Y/N]`)
  # Is DENV NS1 Ag test available? [Y/N]
  paho$SIII17_SQ002_SQ001 <- convert_y_numeric(paho$`Is DENV NS1 Ag test available? [Y/N]`)
  # Is DENV PCR available? [Y/N]
  paho$SIII17_SQ002_SQ005 <- convert_y_numeric(paho$`Is DENV PCR available? [Y/N]`)
  # Is DENV virus isolation available? [Y/N]
  paho$SIII17_SQ002_SQ004 <- convert_y_numeric(paho$`Is DENV virus isolation available? [Y/N]`)
  
  # Is YFV IgG available? [Y/N]
  paho$SIII17_SQ003_SQ007 <- convert_y(paho$`Is YFV IgG available? [Y/N]`)
  # Is YFV IgM available? [Y/N]
  paho$SIII17_SQ003_SQ002 <- convert_y_numeric(paho$`Is YFV IgM available? [Y/N]`)
  # Is YFV neutralizing antibody testing available? [Y/N]
  paho$SIII17_SQ003_SQ003 <- convert_y(paho$`Is YFV neutralizing antibody testing available? [Y/N]`)
  # Is YFV PCR available? [Y/N]
  paho$SIII17_SQ003_SQ005 <- convert_y_numeric(paho$`Is YFV PCR available? [Y/N]`)
  # Is YFV virus isolation available? [Y/N]
  paho$SIII17_SQ003_SQ004 <- convert_y(paho$`Is YFV virus isolation available? [Y/N]`)
  # Is ZIKV IgG available? [Y/N]
  paho$SIII17_SQ004_SQ007 <- convert_y(paho$`Is ZIKV IgG available? [Y/N]`)
  # Is ZIKV IgM available? [Y/N]
  paho$SIII17_SQ004_SQ002 <- convert_y_numeric(paho$`Is ZIKV IgM available? [Y/N]`)
  # Is ZIKV neutralizing antibody testing available? [Y/N]
  paho$SIII17_SQ004_SQ003 <- convert_y(paho$`Is ZIKV neutralizing antibody testing available? [Y/N]`)
  # Is ZIKV PCR available? [Y/N]
  paho$SIII17_SQ004_SQ005 <- convert_y_numeric(paho$`Is ZIKV PCR available? [Y/N]`)
  # Is ZIKV virus isolation available? [Y/N]
  paho$SIII17_SQ004_SQ004 <- convert_y(paho$`Is ZIKV virus isolation available? [Y/N]`)
  
  # Is genome sequencing available? [Y/N]
  paho$SIII17_SQ002_SQ006 <- convert_y_numeric(paho$`Is genome sequencing available? [Y/N]`)
  
  # Is house index used as threshold(s)? [Y/N]
  paho$SV37b_SQ005 <- convert_y(paho$`Is house index used as threshold(s)? [Y/N]`)
  
  # Is the Breteau index used for threshold(s)? [Y/N]
  paho$SV37b_SQ004 <- convert_y(paho$`Is the Breteau index used for threshold(s)? [Y/N]`)
  
  # Is the container index used for threshold(s)? [Y/N]
  paho$SV37b_SQ006 <- convert_y(paho$`Is the container index used for threshold(s)? [Y/N]`)
  
  # Is vector density used for threshold(s)? [Y/N]
  paho$SV37b_SQ003 <- convert_y(paho$`Is vector density used for threshold(s)? [Y/N]`)
  
  # List any other indicator(s) used for threshold(s) [text]
  paho$SV37b_SQ001 <- paho$`List any other indicator(s) used for threshold(s) [text]`
  
  # Is there a record of Aedes aegypti or Aedes albopictus being found in your country in the past 5 years? [dropdown]
  paho$SV34 <- ifelse(paho$`Is there a record of Aedes aegypti or Aedes albopictus being found in your country in the past 5 years? [dropdown]` == 'Neither', 'None found in the country at this time',
                      paho$`Is there a record of Aedes aegypti or Aedes albopictus being found in your country in the past 5 years? [dropdown]`)
  
  # Is there a specific arboviral national program or integrated in another programme?  [text]
  paho$SII07 <- ifelse(paho$`Is there a specific arboviral national program or integrated in another programme?  [text]` == 'Y', 'Specific programme', 'No programme')
  
  # Is there a surveillance system in place for monitoring Aedes resistance to the insecticide(s) used? [Y/N]
  paho$SV39 <- ifelse(paho$`Is there a surveillance system in place for monitoring Aedes resistance to the insecticide(s) used? [Y/N]` == 'Y', 'Yes',
                      ifelse(paho$`Is there a surveillance system in place for monitoring Aedes resistance to the insecticide(s) used? [Y/N]` == 'N', 'No', paho$`Is there a surveillance system in place for monitoring Aedes resistance to the insecticide(s) used? [Y/N]`))
  
  # Is there virological surveillance on humans, ie, tracking of prevailing genotypes/serotypes? [Y/N] (if no, skip to Clinical Management section)
  # all NA, skipping
  
  # List any other arboviral outbreak risk factors that are routinely collected and analysed [text]
  # all NA, skipping
  # paho$SV38_other 
  
  # List any other methods of vector control used in the last 2 years [text]
  paho$SV35_other <- paho$`List any other methods of vector control used in the last 2 years [text]` 
  
  # List other arboviruses that circulated since 2000 [text]
  paho$SII05_other <- paho$`List other arboviruses that circulated since 2000 [text]`
  
  # List other available arbovirus diagnostic tests [text]
  # all NA, skpping
  
  # Management of arboviral disease cases
  # all NA, skipping
  
  # Other mosquito-borne arboviruses, not listed in the previous question, reported in your country from 2015-2020? [text]
  paho$SIX55b <- ifelse(!is.na(paho$`Other mosquito-borne arboviruses, not listed in the previous question, reported in your country from 2015-2020? [text]`), 'Yes', 'No')
  
  # Other reportable arboviruses [text]
  # all NA skipping
  
  # Potential public health threat from Aedes aegypti in your country [dropdown]
  paho$SV34b <- paho$`Potential public health threat from Aedes aegypti in your country [dropdown]`
  
  # Potential public health threat from Aedes albopictus in your country [dropdown]
  paho$SV34c <- paho$`Potential public health threat from Aedes albopictus in your country [dropdown]`
  
  # Reporting tools used at District level [dropdown]
  # all NA skipping
  
  # Reporting tools used at national level [dropdown]
  # all NA skipping
  
  # Reporting tools used at state/provincial level [dropdown]
  # all NA skipping
  
  # Routine vector surveillance and control
  # all NA skipping
  
  # The country has a plan for mosquito-borne disease control that includes a threshold (eg,  level of vector mosquito abundance or minimum infection rate) that would result in a recommendation for mosquito adulticiding/other mosquito reduction measures? [Y/N]
  paho$SV37 <- ifelse(paho$`The country has a plan for mosquito-borne disease control that includes a threshold (eg,  level of vector mosquito abundance or minimum infection rate) that would result in a recommendation for mosquito adulticiding/other mosquito reduction measures? [Y/N]` == 'Y',
                      'Yes, have a threshold that does not require concurrent human cases',
                      ifelse(paho$`The country has a plan for mosquito-borne disease control that includes a threshold (eg,  level of vector mosquito abundance or minimum infection rate) that would result in a recommendation for mosquito adulticiding/other mosquito reduction measures? [Y/N]` == 'N',
                             'No – do not have a formal plan that includes adulticiding to control mosquito-borne diseases', paho$`The country has a plan for mosquito-borne disease control that includes a threshold (eg,  level of vector mosquito abundance or minimum infection rate) that would result in a recommendation for mosquito adulticiding/other mosquito reduction measures? [Y/N]`))
  
  # Virological surveillance using other nucleic acid tests? [Y/N]
  # all NA, skipping
  
  # Virological surveillance using RT-PCR? [Y/N]
  paho$SIII19_SQ002 <- convert_y(paho$`Virological surveillance using RT-PCR? [Y/N]`)
  
  # Virological surveillance using serological tests? [Y/N]
  paho$SIII19_SQ004 <- convert_y(paho$`Virological surveillance using serological tests? [Y/N]`)
  
  # Virological surveillance using virus isolation? [Y/N]
  # all NA, skipping
  
  # Were surveillance staff given advanced training on statistical software for data analysis (e.g.  STATA, R, SAS, Tableau, etc)) and GIS [dropdown]
  # all NA, skipping
  
  # Were surveillance staff given basic training on data capture and analysis (MS Excel, MS Access, EpiInfo) and/or geographic information systems (GIS) [dropdown]
  # all NA, skipping
  
  # What are the criteria for declaring an outbreak of arboviral disease in the country? [text]
  # all NA, skipping
  
  # What kind of training is provided? [text]
  # all NA, skipping
  
  # Which CHIKV cases must be reported [dropdown]
  paho$SII11b_SQ002 <- ifelse(paho$`Which CHIKV cases must be reported [dropdown]` == 'All suspect cases',
                              'Mandatory reporting of all suspect cases',
                              ifelse(paho$`Which CHIKV cases must be reported [dropdown]` == 'Confirmed cases only',
                                     'Mandatory reporting of confirmed cases only',
                                     paho$`Which CHIKV cases must be reported [dropdown]`))
  
  # Which congenital ZIKV cases must be reported [dropdown]
  x <- paho$`Which congenital ZIKV cases must be reported [dropdown]`
  paho$SII11b_SQ006 <- ifelse(x == 'All suspect cases',
                              'Mandatory reporting of all suspect cases',
                              ifelse(x == 'Confirmed cases only',
                                     'Mandatory reporting of confirmed cases only',
                                     x))
  
  # Which DENV cases must be reported [dropdown]
  x <- paho$`Which DENV cases must be reported [dropdown]`
  paho$SII11b_SQ003 <- ifelse(x == 'All suspect cases',
                              'Mandatory reporting of all suspect cases',
                              ifelse(x == 'Confirmed cases only',
                                     'Mandatory reporting of confirmed cases only',
                                     x))
  
  # Which suspect arbovirus disease cases have laboratory testing during non-outbreak periods?
  paho$SIII15_SQ002 <- paho$`Which suspect arbovirus disease cases have laboratory testing during non-outbreak periods?`
  
  #   Which suspect arbovirus disease cases have laboratory testing during outbreaks? [dropdown]
  paho$SIII15_SQ001 <- paho$`Which suspect arbovirus disease cases have laboratory testing during outbreaks? [dropdown]`
  
  # Which YFV cases must be reported [dropdown]
  x <- paho$`Which YFV cases must be reported [dropdown]`
  paho$SII11b_SQ004 <- ifelse(x == 'All suspect cases',
                              'Mandatory reporting of all suspect cases',
                              ifelse(x == 'Confirmed cases only',
                                     'Mandatory reporting of confirmed cases only',
                                     x))
  
  # Which ZIKV cases must be reported [dropdown]
  x <- paho$`Which ZIKV cases must be reported [dropdown]`
  paho$SII11b_SQ005 <- ifelse(x == 'All suspect cases',
                              'Mandatory reporting of all suspect cases',
                              ifelse(x == 'Confirmed cases only',
                                     'Mandatory reporting of confirmed cases only',
                                     x))
  
  # Turn all characters into factors and merge
  tf <- tempfile(fileext = '.csv')
  write_csv(data, tf)
  data <- read_csv(tf) # doing to get rid of factors
  
  # Get rid of paho names
  paho <- paho[,!names(paho) %in% original_paho_names]
  
  # Add region
  paho$Region <- 'PAHO'
  
  # Combine 
  data <- bind_rows(
    data %>% mutate(survey = 'Original'),
    paho %>% mutate(survey = 'PAHO')
  )
  save(data, file = 'data/combined_data.RData')
}
