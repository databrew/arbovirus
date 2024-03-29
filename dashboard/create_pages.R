library(readr)
library(dplyr)

# use all regions for a dashboard with a global tab,
# use just one region for a region-only dashboard

regions <- "WPRO"
# regions <- c("AMRO","EMRO","EURO","SEARO","WPRO")

# remove any existing dashboard files before creating new dashboard :

file.remove( dir(pattern = "^AMRO_", include.dirs = FALSE) )
file.remove( dir(pattern = "^EMRO_", include.dirs = FALSE) )
file.remove( dir(pattern = "^EURO_", include.dirs = FALSE) )
file.remove( dir(pattern = "^SEARO_", include.dirs = FALSE) )
file.remove( dir(pattern = "^WPRO_", include.dirs = FALSE) )

# create _site.yml and render dashboard into appropriate directory:

site_yml <- paste0( "name: 'WHO-ARBO' \n" )
if( length( regions) == 1 ){
  site_yml <- paste0( site_yml, 
                      "output_dir: '_",
                      regions[1],
                      "' \n" )
} else{
  site_yml <- paste0( site_yml, 
                      "output_dir: '_WHOA' ",
                      "\n" )
}
site_yml <- paste0( site_yml,
                    "output:\n",
                    "  html_document: \n",
                    "    includes: \n",
                    "      after_body: footer.html \n",
                    "    css: styles.css",
                    "\n" )
write_file( site_yml, "_site.yml", append=FALSE )

load("../data/data.RData")

# for simplicity, use first question per page in filename
pages <- c("5","6","11","14",              # Section 2
           "15","17","19","20",            # Section 3
           "21","25",                      # Section 4
           "26","28","34","35","37","40",  # Section 5
           "41",                           # Section 6
           "43","44","46",                 # Section 7
           "47","49","54",                 # Section 8
           "58","61"                       # Section 10
           )
pages <- paste0("Q",pages)
pages <- c( pages, 
            "participation")

global_pages <- paste0( "Q", c("5", "12", "17", "21", "29","43","47") )
global_pages <- c( global_pages, "participation")

menu_start <- function( id ){
  html <- paste0("<div id='", 
                 id, 
                 "' class='collapse main-nav-toggle container-sub-menu'>\n",
                 "<div class='container'>\n",
                 "<div class='row'>\n")
  return(html)
}

submenu_start <- function(){
  return("<div class='col-sm-6 text-left'>\n<ul class='submenu-text-formatting'>\n")
}

submenu_title <- function( text ){
  return( paste0("<li><a>", text, "</a></li>\n") )
}

submenu_item <- function( prefix, suffix, text ){
  return( paste0("<li><a href='", prefix, "_", suffix, ".html'>", text, "</a></li>\n") )
}

submenu_dropdown <- function( child, submenu, text ){
  return( paste0("<li>\n",
                 "<a role='button' data-toggle='collapse' href='#",
                 child,
                 "' aria-expanded='false' aria-controls='",
                 submenu,
                 "'>",
                 text,
                 "</a>\n",
                 "</li>\n"))
}

submenu_end <- function(){
  return("</ul>\n</div>\n")
}

menu_end <- function(){
  return("</div>\n</div>\n</div>\n")
}

header_content <- function( region, page, global=FALSE ){
  
  # region selection and navigation
  content <- "<div class='flex-container'>\n"
  content <- paste0(content, 
                    "<h1 class='logo'><img id='WHO_logo' src='img/WHO_Logo.png'></h1>\n",
                    "<div class='dropdown navigation'>\n",
                    "<button onclick='myFunction()' class='dropbtn'>Selected regional office: &nbsp; \n",
                    "<span class='selected_region'>", region, "</span>\n",
                    "<span class='selected_region_arrow_down'>&#8681;</span>\n",
                    "</button>\n",
                    "<div id='myDropdown' class='dropdown-content'>\n")
  for(i in 1:length(regions)){
    if( regions[i]!=region){
      if( global ){
        content <- paste0(content, "<a href='", regions[i], "_", page, "_global.html'>", regions[i], "</a>\n")
      } else{
        content <- paste0(content, "<a href='", regions[i], "_", page, ".html'>", regions[i], "</a>\n")
      }
    }
  }
  content <- paste0( content, "</div>\n</div>\n</div>\n\n" )
  
  # navbar (exclude global tab if only one region)
  content <- paste0(
    content,
    "<ul id='navbar' class='blue-sub-nav'>\n",
    "<li id='whiteLogoPosition'>\n<img id='white_WHO_logo' src='img/WHO_LOGO_white.png'>\n</li>\n",
    "<li id='Overview-Li-area'>\n",
    "<a role='button' data-toggle='collapse' href='#overview-navigation' aria-expanded='false' aria-controls='overview-navigation'>Arbovirus survey overview</a>\n"
  )
  
  if(length(regions) > 1) {
    content <- paste0(
      content,
      "<li id='Global-Li-area'>\n",
      "<a role='button' data-toggle='collapse' href='#global-navigation' aria-expanded='false' aria-controls='global-navigation'>Global arbovirus survey results</a>\n"
    )
  }
  
  content <- paste0(
    content,
    "</li>\n<li id='Regional-Li-area'>\n",
    "<a role='button' data-toggle='collapse' href='#regional-navigation' aria-expanded='false' aria-controls='regional-navigation'>Regional arbovirus survey results</a>\n",
    "</li>\n<li>\n<a href='",
    region,
    "_national.html'>National arbovirus survey results</a>\n</li>\n</ul>\n\n"
  )

  # drop-down menus
  # Overview NAV
  content <- paste0( content,
                     menu_start("overview-navigation"), 
                     submenu_start(), 
                     submenu_item(region, "description", "Original survey & description"),
                     # submenu_item(region, "participation", "Participating countries"), 
                     submenu_end(),
                     menu_end() )
  
  # Global NAV
  if( length( regions ) > 1 ){
    content <- paste0( content,
                       menu_start("global-navigation"), 
                       submenu_start(),
                       submenu_item(region, "participation_global", "Survey response"),
                       submenu_item(region, "Q5_global", "Autochthonous arbovirus transmission status"),
                       submenu_item(region, "Q12_global", "Arbovirus disease surveillance planning and practice"), 
                       submenu_item(region, "Q17_global", "Arbovirus laboratory capacity"),
                       submenu_item(region, "Q21_global", "Management of arboviral disease cases"),
                       submenu_item(region, "Q29_global", "Vector surveillance and control"),
                       submenu_item(region, "Q43_global", "Community sensitization and participation"),
                       submenu_item(region, "Q47_global", "Preparedness for arboviral outbreaks/epidemics"),
                       submenu_end(),
                       menu_end() )
  }
  
  # Regional drop-down parent menus
  content <- paste0( content,
                     menu_start("regional-navigation"),
                     submenu_start(), 
                     submenu_item(region, "participation", "Participating countries"), 
                     submenu_dropdown("regional-navigation-disease-surveillance",
                                      "regional-navigation",
                                      "Arboviral disease surveillance system"),
                     submenu_dropdown("regional-navigation-lab-capacity",
                                      "regional-navigation",
                                      "Arbovirus laboratory capacity"),
                     submenu_dropdown("regional-navigation-management",
                                      "regional-navigation",
                                      "Management of arboviral disease cases"),
                     submenu_dropdown("regional-navigation-vector-surveillance",
                                      "regional-navigation",
                                      "Routine vector surveillance and control"),
                     submenu_item(region, "Q41", "Animal surveillance"),
                     submenu_dropdown("regional-navigation-community",
                                      "regional-navigation",
                                      "Community sensitization and participation"),
                     submenu_dropdown("regional-navigation-preparedness",
                                      "regional-navigation",
                                      "Preparedness for arboviral outbreaks/epidemics"),
                     submenu_dropdown("regional-navigation-surveillance-staffing",
                                      "regional-navigation",
                                      "Surveillance staffing"),
                     submenu_end(),
                     menu_end() )
  
  # Regional drop-down child menus
  content <- paste0( content,
                     menu_start("regional-navigation-disease-surveillance"),
                     submenu_start(),
                     submenu_item(region, "Q5", "Autochthonous (local mosquito-borne) circulation"),
                     submenu_item(region, "Q6", "Arbovirus surveillance administration and planning"), 
                     submenu_item(region, "Q11", "Disease reporting requirements and practices"),
                     submenu_item(region, "Q14", "Successes and barriers/challenges"),
                     submenu_end(),
                     menu_end(), 
                     menu_start("regional-navigation-lab-capacity"),
                     submenu_start(),
                     submenu_item(region, "Q15", "Testing practices (cases tested and viruses targeted)"), 
                     submenu_item(region, "Q17", "Testing capacity"),
                     submenu_item(region, "Q19", "Virological surveillance"), 
                     submenu_item(region, "Q20", "Successes and barriers/challenges"),
                     submenu_end(),
                     menu_end(), 
                     menu_start("regional-navigation-management"),
                     submenu_start(),
                     submenu_item(region, "Q21", "Clinical guidelines and training"), 
                     submenu_item(region, "Q25", "Successes and barriers/challenges"),
                     submenu_end(),
                     menu_end(), 
                     menu_start("regional-navigation-vector-surveillance"),
                     submenu_start(),
                     submenu_item(region, "Q26", "Entomologic surveillance administration and reporting"), 
                     submenu_item(region, "Q28", "Mosquito surveillance practices"), 
                     submenu_item(region, "Q34", "Vector distribution and transmission risk"), 
                     submenu_item(region, "Q35", "Vector control practices"), 
                     submenu_item(region, "Q37", "Control plans, thresholds, and indicators"), 
                     submenu_item(region, "Q40", "Successes and barriers/challenges"), 
                     submenu_end(),
                     menu_end(),
                     menu_start("regional-navigation-community"),
                     submenu_start(),
                     submenu_item(region, "Q43", "Community outreach programme capacity"), 
                     submenu_item(region, "Q44", "Public notification of arboviral disease risk and control"), 
                     submenu_item(region, "Q46", "Successes and barriers/challenges"), 
                     submenu_end(),
                     menu_end(),
                     menu_start("regional-navigation-preparedness"),
                     submenu_start(),
                     submenu_item(region, "Q47", "Outbreak response planning and infrastructure"), 
                     submenu_item(region, "Q49", "Outbreak declaration and emergency measures"),
                     submenu_item(region, "Q54", "Successes and barriers/challenges"),
                     submenu_end(),
                     menu_end(),
                     menu_start("regional-navigation-surveillance-staffing"),
                     submenu_start(),
                     submenu_item(region, "Q58", "Surveillance staff capacity"), 
                     submenu_item(region, "Q61", "Arboviral expertise resources"),
                     submenu_end(),
                     menu_end() )
  
  # National NAV

  return( content )
}

# create html headers and RMD files -----

for(j in 1:length( regions )){
  region <- regions[j]
  
  # make regional pages -----
  for(k in 1:length(pages)){
    
    # make header file to be included in RMD file:
    header_path <- paste0(region, "_", pages[k], "_header.html")
    write_file( header_content( region, pages[k] ), header_path, append=FALSE )
    
    # make RMD file:
    rmd_path <- paste0(region, "_", pages[k], ".Rmd")
    yaml <- paste0("---\ntitle: ' '\npagetitle: '", region, " ", pages[k], "'\noutput:\n  html_document:\n    includes:\n      in_header: ", header_path, "\nparams:\n  region: ",region,"\n---\n")
    frontmatter <- read_file("chunk_frontmatter.Rmd")
    filter <- "\n```{r}\ndata <- data %>% filter(Region==params$region) %>% droplevels() %>% mutate(SI01 = as.character(SI01)) %>% arrange( SI01 )\n```\n"
    chunks <- read_file( paste0("regional/", pages[k], ".Rmd") )
    write_file( paste0(yaml,frontmatter,filter,chunks), rmd_path, append=FALSE )
  }
  
  # make overview/description pages -----
  
  # make header file to be included in RMD file:
  header_path <- paste0(region, "_description_header.html")
  write_file( header_content( region, "description" ), header_path, append=FALSE )
  
  # make RMD file:
  rmd_path <- paste0(region, "_description.Rmd")
  yaml <- paste0("---\ntitle: ' '\npagetitle: '", region, " ", "description", "'\noutput:\n  html_document:\n    includes:\n      in_header: ", header_path, "\nparams:\n  region: ",region,"\n---\n")
  frontmatter <- read_file("chunk_frontmatter.Rmd")
  content <- read_file("overview/description.Rmd")
  write_file( paste0(yaml,frontmatter,content), rmd_path, append=FALSE )
  
  # make national pages -----

  # make header file to be included in RMD file:
  header_path <- paste0(region, "_national_header.html")
  write_file( header_content( region, "national" ), header_path, append=FALSE )
  
  # make RMD file:
  rmd_path <- paste0(region, "_national.Rmd")
  yaml <- paste0("---\ntitle: ' '\npagetitle: '", region, " ", "national", "'\noutput:\n  html_document:\n    includes:\n      in_header: ", header_path, "\nparams:\n  region: ",region,"\n---\n")
  frontmatter <- read_file("chunk_frontmatter.Rmd")
  
  if(region != "AMRO" ){
    content <- "\nAvailable reports (PDF) : \n\n<ul>\n"
    countries <- data %>% filter(Region==region) %>% droplevels() %>% mutate(SI01 = as.character(SI01)) %>% arrange( SI01 ) %>% pull(SI01)
    for( k in 1:length(countries)){
      country <- countries[k]
      content <- paste0(content, "<li><a href=\"country_reports/", country, ".pdf\" style=\"color:#048eca;\">", country, "</a></li>\n")
    }
    content <- paste0( content, "</ul>\n")
  } else{
    content <- "\nIndividual country reports are not available for AMRO nations. Please see the Arbovirus Survey Overview for more information.\n"
  }
  
  write_file( paste0(yaml,frontmatter,content), rmd_path, append=FALSE )
  
  # make  global pages -----
  
  if( length( regions ) > 1 ){
    for( k in 1:length( global_pages )){
      # make header file to be included in RMD file:
      header_path <- paste0(region, "_", global_pages[k], "_global_header.html")
      write_file( header_content( region, global_pages[k], global=TRUE ), header_path, append=FALSE )
    
      rmd_path <- paste0(region, "_", global_pages[k], "_global.Rmd")
      yaml <- paste0("---\ntitle: ' '\npagetitle: '", region, " ", global_pages[k], " global'\noutput:\n  html_document:\n    includes:\n      in_header: ", header_path, "\nparams:\n  region: ",region,"\n---\n")
      frontmatter <- read_file("chunk_frontmatter.Rmd")
      filter <- "\n```{r}\ndata <- data %>% mutate(SI01 = as.character(SI01)) %>% arrange( SI01 )\n```\n"
      chunks <- read_file( paste0("global/", global_pages[k], "_global.Rmd") )
      write_file( paste0(yaml,frontmatter,filter,chunks), rmd_path, append=FALSE )
    }
  }
  
}

