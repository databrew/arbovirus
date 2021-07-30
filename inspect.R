
# get the survey results, as processed by WHO script:

if( file.exists("data/data.RData" )){
  data = load("data/data.RData")
} else{
  setwd("data/")
  source("survey_375147_R_syntax_file.R")
  save(data, file="data.RData")
  setwd("../")
}

# check data against specifications in data dictionary:


