library(readr)

regions <- c("ALL","EMRO","EURO","PAHO","SEARO","WPRO")

# for simplicity, use first question per page as filename
pages <- c("5","6","11","14",              # Section 2
           "58", "61",                     # Section 10
           "15","17","19","20",            # Section 3
           "21","25",                      # Section 4
           "26","28","34","35","37","40",  # Section 5
           "41",                           # Section 6
           "43","44","46",                 # Section 7
           "47","49","54"                  # Section 8
           )
pages <- paste0("Q",pages)
pages <- c( pages, 
            "context", 
            # "participation", 
            "national", 
            "about" )

menu_start <- function( id ){
  html <- paste0("<div id='", 
                 id, 
                 "' class='collapse main-nav-toggle container-sub-menu'>\n",
                 "<div class='container'>\n",
                 "<div class='row'>\n")
  return(html)
}

submenu_start <- function(){
  return("<div class='col-sm-3 text-left'>\n<ul class='submenu-text-formatting'>\n")
}

submenu_href_title <- function( region, suffix, text ){
  return( paste0("<li><h4><a href='", region, "_", suffix, ".html'>", text, "</a></h4></li>\n") )
}

submenu_title <- function( text ){
  return( paste0("<li><h4><a>", text, "</a></h4></li>\n") )
}

submenu_item <- function( region, suffix, text ){
  return( paste0("<li><a href='", region, "_", suffix, ".html'>", text, "</a></li>\n") )
}

submenu_end <- function(){
  return("</ul>\n</div>\n")
}

menu_end <- function(){
  return("</div>\n</div>\n</div>\n")
}

header_content <- function( region, page ){
  
  # region selection and navigation
  content <- "<div class='flex-container'>\n"
  content <- paste0(content, 
                    "<h1 class='logo'><img id='WHO_logo' src='img/WHO_Logo.png'></h1>\n",
                    "<ul class='navigation'>\n",
                    "<li><a>Select</a></li>\n<li><a>the</a></li>\n<li><a>region(s)</a></li>\n<li><a>of</a></li>\n<li><a>interest:</a></li>\n")
  for(i in 1:length(regions)){
    if( regions[i]==region){
      content <- paste0(content, "<li><a class='region_active' href=''>", regions[i], "</a></li>\n")
    } else{
      content <- paste0(content, "<li><a href='", paste0(regions[i], "_", page, ".html"), "'>", regions[i], "</a></li>\n")
    }
  }
  content <- paste0( content, "<li><a>&nbsp;</a></li>\n</ul>\n</div>\n\n" )
  
  # navbar 
  content <- paste0(content, 
                    "<ul id='navbar' class='blue-sub-nav'>\n",
                    "<li id='whiteLogoPosition'>\n<img id='white_WHO_logo' src='img/WHO_LOGO_white.png'>\n</li>\n",
                    "<li id='Overview-Li-area'>\n",
                    "<a role='button' data-toggle='collapse' href='#overview-navigation' aria-expanded='false' aria-controls='overview-navigation'>Arbovirus survey overview</a>\n",
                    "</li>\n<li id='Regional-Li-area'>\n",
                    "<a role='button' data-toggle='collapse' href='#regional-navigation' aria-expanded='false' aria-controls='regional-navigation'>Regional arbovirus survey results</a>\n",
                    # "</li>\n<li id = 'Country-Li-area'>\n",
                    # "</li>\n<li>\n<a role='button' data-toggle='collapse' href='", region, "_national.html'>National arbovirus survey results</a>\n",
                    "</li>\n<li>\n<a href='", region, "_national.html'>National arbovirus survey results</a>\n",
                    # "</li>\n<li>\n<a role='button' data-toggle='collapse' href='", region, "_about.html'>About</a>\n</li>\n</ul>\n\n")
                    "</li>\n<li>\n<a href='", region, "_about.html'>About</a>\n</li>\n</ul>\n\n")
  
  # drop-down menus
  # Overview NAV
  content <- paste0( content,
                     menu_start("overview-navigation"), 
                     submenu_start(), submenu_href_title(region, "context", "Survey context"), submenu_end(),
                     submenu_start(), submenu_href_title(region, "participation", "Participating countries"), submenu_end(),
                     menu_end() )
  # Regional NAV
  content <- paste0( content,
                     menu_start("regional-navigation"),
                     submenu_start(), 
                     submenu_title("Arboviral disease surveillance system"),
                     submenu_item(region, "Q5", "Autochthonous (local mosquito-borne) circulation"),
                     submenu_item(region, "Q6", "Arbovirus surveillance administration and planning"), 
                     submenu_item(region, "Q11", "Disease reporting requirements and practices"),
                     submenu_item(region, "Q14", "Successes and barriers/challenges"),
                     submenu_title("Surveillance staffing"),
                     submenu_item(region, "Q58", "Surveillance staff capacity"), 
                     submenu_item(region, "Q61", "Arboviral expertise resources"),
                     submenu_end(),
                     submenu_start(),
                     submenu_title("Arbovirus laboratory capacity"),
                     submenu_item(region, "Q15", "Testing practices (cases tested and viruses targeted)"), 
                     submenu_item(region, "Q17", "Testing capacity"),
                     submenu_item(region, "Q19", "Virological surveillance"), 
                     submenu_item(region, "Q20", "Successes and barriers/challenges"),
                     submenu_title("Management of arboviral disease cases"),
                     submenu_item(region, "Q21", "Clinical guidelines and training"), 
                     submenu_item(region, "Q25", "Successes and barriers/challenges"),
                     submenu_end(),
                     submenu_start(),
                     submenu_title("Routine vector surveillance and control"),
                     submenu_item(region, "Q26", "Entomologic surveillance administration and reporting"), 
                     submenu_item(region, "Q28", "Mosquito surveillance practices"), 
                     submenu_item(region, "Q34", "Vector distribution and transmission risk"), 
                     submenu_item(region, "Q35", "Vector control practices"), 
                     submenu_item(region, "Q37", "Control plans, thresholds, and indicators"), 
                     submenu_item(region, "Q40", "Successes and barriers/challenges"), 
                     submenu_href_title(region, "Q41", "Animal surveillance"),
                     submenu_end(),
                     submenu_start(),
                     submenu_title("Community sensitization and participation"),
                     submenu_item(region, "Q43", "Community outreach programme capacity"), 
                     submenu_item(region, "Q44", "Public notification of arboviral disease risk and control"), 
                     submenu_item(region, "Q46", "Successes and barriers/challenges"), 
                     submenu_title("Preparedness for arboviral outbreaks/epidemics"),
                     submenu_item(region, "Q47", "Outbreak response planning and infrastructure"), 
                     submenu_item(region, "Q49", "Outbreak declaration and emergency measures"),
                     submenu_item(region, "Q54", "Successes and barriers/challenges"),
                     submenu_end(),
                     menu_end() )
  
  # National NAV
    
  return( content )
}

# create html headers for pages (one per question per region) AND create RMD files

for(j in 1:length( regions )){
  region <- regions[j]
  for(k in 1:length(pages)){
    
    # make header file to be included in RMD file:
    header_path <- paste0(region, "_", pages[k], "_header.html")
    write_file( header_content( region, pages[k] ), header_path, append=FALSE )
    
    # make RMD file:
    rmd_path <- paste0(region, "_", pages[k], ".Rmd")
    yaml <- paste0("---\ntitle: ' '\npagetitle: '", region, " ", pages[k], "'\noutput:\n  html_document:\n    includes:\n      in_header: ", header_path, "\nparams:\n  region: ",region,"\n---\n")
    frontmatter <- read_file("chunk_frontmatter.Rmd")
    if( region != "ALL"){
      filter <- "\n```{r}\ndata <- data %>% filter(Region==params$region) %>% droplevels() %>% mutate(SI01 = as.character(SI01)) %>% arrange( SI01 )\n```\n"
    } else{
      filter <- "\n```{r}\ndata <- data %>% mutate(SI01 = as.character(SI01)) %>% arrange( SI01 )\n```\n"
    }
    write_file( paste0(yaml,frontmatter,filter), rmd_path, append=FALSE )
  }
}

