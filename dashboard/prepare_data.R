library(dplyr)
library(tidyr)
library(ggplot2)
library(Hmisc)
library(RColorBrewer)
library(scales)
library(leaflet)
library(leaflet.extras)

#############################################
# WHO profided shapefiles
#############################################
# Read in WHO shapefiles
if('who_shp.RData' %in% dir()){
  load('who_shp.RData')
} else {
  library(whomapper) # https://github.com/whocov/whomapper
  # options(scipen = '999')
  who_shp <- whomapper::pull_who_adm0()
  save(who_shp, file = 'who_shp.RData')
}
# Source WHO provided function for mapping
source('who_map_disp.R')

#############################################
# Other shape files
#############################################
load('../data/world_shp.rda') # load world shape file
load('../data/region_shp.rda') # load region shape file

#############################################
# Load up data from initial survey (non-PAHO)
#############################################
source('functions.R')
df <- load_data(modify_variable_names = TRUE)
df$country <- as.character(df$`1. State`)
df$adm0_name <- toupper(df$country)

# Define WHO regions
who_regions <- who_shp$adm0

#############################################
# Read in PAHO data
#############################################
# https://trello.com/c/LgyKpQfk/2696-who-new-dataset-combination
library(readxl)
pahoxl <- read_excel('../data/Copia_de_PAHO_key_indicator_spreadsheet_19_Nov_2021-Completo.xlsx', skip = 1)
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
