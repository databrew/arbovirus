library(tidyverse)
library(readxl)
library(stringr)
library(pander)
library(knitr)
library(rmarkdown)

# Load data to get list of countries
if( file.exists("data/data.RData")){
  load("data/data.RData")
} else{
  message("You need the data!")
}
countries <- as.character(data$SI01)


# Create a directory for stashing country reports
report_dir <- 'country_missingness_reports'
if(!dir.exists(report_dir)){
  dir.create(report_dir)
}

for(country in countries){
  message(country)
  render('report.Rmd',
         output_file = paste0(report_dir, '/', country, '.html'),
         params = list('country' = country))
}


