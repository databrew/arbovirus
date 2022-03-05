library(readr)

if( file.exists("../data/data.RData")){
  load("../data/data.RData")
} else{
  message("You need the data!")
}

regions <- levels( data$Region )

# for simplicity, use first question per page as filename
questions <- c("5","6","11","14",              # Section 2
               "15","17","19","20",            # Section 3
               "21","25",                      # Section 4
               "26","28","34","35","37","40",  # Section 5
               "41",                           # Section 6
               "43","44","46",                 # Section 7
               "47","49","50"                  # Section 8
               )
questions <- paste0("Q",questions)

header_content <- function( region, question ){
  
  # region selection and navigation -- stay on same table after changing region 
  
  options <- c("ALL","EMRO","EURO","PAHO","SEARO","WPRO")
  
  content <- "<div class='flex-container'>\n"
  content <- paste0(content, "<h1 class='logo'><img id='WHO_logo' src='img/WHO_Logo.png'></h1>\n")
  content <- paste0(content, "<ul class='navigation'>\n")
  content <- paste0(content,"<li><a>Select</a></li>\n<li><a>the</a></li>\n<li><a>region(s)</a></li>\n<li><a>of</a></li>\n<li><a>interest:</a></li>\n")
  
  for(i in 1:length(options)){
    if( options[i]==region){
      content <- paste0(content, "<li><a class='region_active' href=''>", options[i], "</a></li>\n")
    } else{
      content <- paste0(content, "<li><a href='", paste0(options[i], "_", question, ".html"), "'>", options[i], "</a></li>\n")
    }
  }
  content <- paste0(content, "<li><a>&nbsp;</a></li>\n</ul>\n</div>\n\n")
  
  return( content )
}

# create html headers for pages (one per question per region) AND create RMD files

for(j in 1:length( regions )){
  region <- regions[j]
  for(k in 1:length(questions)){
    
    # make header file to be included in RMD file:
    header_path <- paste0(region, "_", questions[k], "_header.html")
    write_file( header_content( region, questions[k] ), header_path, append=FALSE )
    
    # make RMD file:
    rmd_path <- paste0(region, "_", questions[k], ".Rmd")
    yaml <- paste0("---\ntitle: ' '\noutput:\n  html_document:\n    includes:\n      in_header: ", header_path, "\nparams:\n  region: ",region,"\n---\n")
    frontmatter <- read_file("chunk_frontmatter.Rmd")
    filter <- "\n```{r}\ndata <- data %>% filter(Region==params$region) %>% droplevels() %>% mutate(SI01 = as.character(SI01)) %>% arrange( SI01 )\n```\n"
    write_file( paste0(yaml,frontmatter,filter), rmd_path, append=FALSE )
  }
}
