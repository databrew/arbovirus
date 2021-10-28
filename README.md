
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![Codecov test
coverage](https://codecov.io/gh/databrew/arbovirus/branch/main/graph/badge.svg)](https://codecov.io/gh/databrew/arbovirus?branch=main)
<!-- badges: end -->

# Overview

This repository consists of a data analysis pipeline of the World Health
Organization, built in collaboration with [Databrew
LLC](https://databrew.cc). It contains code for processing, analyzing,
and visualizing data from a global arbovirus survey. The below
instructions lay out how a developer can (a) prepare her repository for
analysis by setting up data, (b) generate an analytical webpage /
dashboard, (c) generate a “simplified” dataset for further analysis, and
(d) generate a missingness report for operational and data collection
monitoring.

# Developer instructions

## Setting up data

-   Start by cloning this repository (if needed, instructions for
    cloning a repository from github are available
    [here](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository)).
-   Once you’ve got the repository on your local machine, in the main
    repo, create a folder named `data`. Populate it with the files in
    `data.zip` sent to you directly.
-   The contents of your `arbovirus` `data` folder should look like
    this:

<!-- -->

    # tree
    ├── data
    │   ├── Data_dictionary_Survey375147.csv
    │   ├── data.RData
    │   ├── Regions_Countries.csv
    │   ├── survey_375147_R_data_file.csv
    │   └── survey_375147_R_syntax_file.R

## Generating a dashboard

-   Open `dashboard/index.Rmd` in Rstudio  
-   Click the “knit” button
-   A deploy-ready dashboard will be created in `dashboard/_site`. It
    can be explored by opening `dashboard/_site/index.html` in a web
    browswer

## Generating a simplified dataset

-   `cd` into the `dashboard` directory, then source a suite of
    functions/utilities by running:

<!-- -->

    source('app_functions.R')

-   Then, run the following in R:

<!-- -->

    simple <- load_data(modify_variable_names = TRUE)
    readr::write_excel_csv(simple, '~/Desktop/simplified_dataset.csv')

The above will write a file to your desktop of “simplified” data.

## Generating missingness reports

-   Open `missingness/missing.Rmd` in Rstudio  
-   Follow the instructions in `missingness/instructions.md`
