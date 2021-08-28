
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

## Installation

You can install the development version from
[GitHub](https://github.com/)
with:

``` r
sudo su - -c "R -e \"devtools::install_github('databrew/arbovirus', subdir = 'arboapp')\"";
```

## Developer instructions

### Setting up data

  - In `arboapp/dev` create a folder named `data`. Populate it with the
    files sent to you directly by Joe.
  - The contents of your `dev` folder should look like this:

<!-- end list -->

    dev/
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
    └── run_dev.R

### Running the app locally

  - `cd` into `dev`  
  - Run `Rscript run_dev.R`
