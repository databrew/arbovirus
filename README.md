
<!-- README.md is generated from README.Rmd. Please edit that file -->

# arboapp

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![Codecov test
coverage](https://codecov.io/gh/databrew/arbovirus/branch/main/graph/badge.svg)](https://codecov.io/gh/databrew/arbovirus?branch=main)
<!-- badges: end -->

`arboapp` is a data exploration application of the World Health
Organization, built in collaboration with [Databrew
LLC](https://databrew.cc).

## Developer instructions

### Setting up data

  - In `arboapp/dev` create a folder named `data`. Populate it with the
    files in `data.zip` sent to you directly by Joe.
  - In `arboapp/dev` create a folder named `misc`. Populate it with the
    files in `misc.zip` sent to you directly by Joe.
  - The contents of your `dev` folder should look like this:

<!-- end list -->

    # tree dev
    dev
    ├── 01_start.R
    ├── 02_dev.R
    ├── 03_deploy.R
    ├── data
    │   ├── data.RData
    │   ├── Dummy data subset_375147_16 June.xlsx
    │   ├── limesurvey_survey_375147.lss
    │   ├── limesurvey_survey_375147.txt
    │   ├── Regions_Countries.xlsx
    │   ├── results-survey375147.csv
    │   ├── survey_375147_en.xml
    │   ├── survey_375147_R_data_file.csv
    │   ├── survey_375147_R_syntax_file.R
    │   └── survey_archive_375147.lsa
    ├── misc
    │   ├── Data dictionary_Survey 375147_16 June 2021.xlsx
    │   ├── Data_dictionary_Survey375147.csv
    │   └── survey_375147_R_syntax_file.R
    └── run_dev.R

### Running the app locally

  - `cd` into `dev`  
  - Run `Rscript run_dev.R`

## Installation

You can install the development version from
[GitHub](https://github.com/)
with:

``` r
sudo su - -c "R -e \"devtools::install_github('databrew/arbovirus', subdir = 'arboapp')\"";
```

To deploy the latest version to a shiny server:

  - Create an `arbo` directory in `/srv/shiny-server`
  - `scp` the `data` and `misc` folders into that directory
  - Grant writing permissions: `sudo chmod -R 777 arbo`
  - Run the
    below:

<!-- end list -->

    sudo systemctl stop shiny-server; sudo su - -c "R -e \"remove.packages('arboapp')\""; sudo su - -c "R -e \"devtools::install_github('databrew/arbovirus', subdir = 'arboapp')\""; sudo chmod -R 777 /usr/local/lib/R/site-library; sudo chmod -R 777 /usr/lib/R/site-library/; sudo chmod -R 777 /usr/lib/R/library; sudo systemctl restart shiny-server;
