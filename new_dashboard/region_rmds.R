library(readr)

if( file.exists("../data/data.RData")){
  load("../data/data.RData")
} else{
  message("You need the data!")
}

regions <- levels( data$Region )

# for simplicity, use first question per page as filename
filenames <- c("5","6","11","14",              # Section 2
               "15","17","19","20",            # Section 3
               "21","25",                      # Section 4
               "26","28","34","35","37","40",  # Section 5
               "41",                           # Section 6
               "43","44","46",                 # Section 7
               "47","49","50"                  # Section 8
               )
filenames <- paste0("Q",filenames, ".Rmd")

# create RMDs for dashboard
for(j in 1:length( regions )){
  region <- regions[j]
  for(k in 1:length(filenames)){
    path <- paste0(region, "/", filenames[k])
    yaml <- paste0("---\ntitle: ' '\noutput: html_document\nparams:\n  region: ",region,"\n---\n")
    frontmatter <- read_file("chunk_frontmatter.Rmd")
    filter <- "\n```{r}\ndata <- data %>% filter(Region==params$region) %>% droplevels() %>% mutate(SI01 = as.character(SI01)) %>% arrange( SI01 )\n```\n"
    contents <- paste0(yaml,frontmatter,filter)
    write_file(contents, path, append=FALSE)
  }
}

