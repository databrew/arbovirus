library(readr)

if( file.exists("data/data.RData")){
  load("data/data.RData")
} else{
  message("You need the data!")
}

regions <- levels( data$Region )

if(!dir.exists('region_reports')){
  dir.create('region_reports')
}

# create reports
for(j in 1:length( regions )){
  nom <- regions[j]
  if( !is.na( nom ) ){
    report_name <- paste0("region_reports/",nom,".html")
    rmarkdown::render( "one_region.Rmd", 
                       params=list(region=nom), 
                       output_file = report_name )
    rmarkdown::render( "region_chunks.Rmd", 
                        params=list(region=nom))
  }
}

# filename is assumed to have extension .Rmd
tabs_html <- function( filename ){
  region_question <- unlist( strsplit( filename , ".", fixed=TRUE))[1]
  region_question <- unlist( strsplit( region_question, "_", fixed=TRUE))
  region <- region_question[1]
  question <- region_question[2]
  
  html <- '\n<ul class="custom_tabbar">\n'
  for(j in 1:length( regions )){
    if( regions[j] == region ){
      html <- paste0( html, '<li class="custom_tabbar__list-active"><a href="' )
    } else{
      html <- paste0( html,'<li><a href="' )
    }
    html <- paste0( html,
                    regions[j], '_', question,
                    '.html">',
                    regions[j],
                    '</a></li>\n' )
  }
  html <- paste0( html, '</ul>\n' )
  return( html )
}

# create RMDs for dashboard
for(j in 1:length( regions )){
  region <- regions[j]
  filenames <- dir("new_dashboard")[ grep(region, dir("new_dashboard")) ]
  for(k in 1:length(filenames)){
    path <- paste0("new_dashboard/",filenames[k])
    frontmatter <- read_file("chunk_frontmatter.Rmd")
    frontmatter <- paste0(frontmatter,"\n```{r}\ndata <- data %>% filter(Region=='", region, "') %>% droplevels() %>% mutate(SI01 = as.character(SI01)) %>% arrange( SI01 )\n```\n")
    # tabs <- tabs_html( filenames[k] )
    chunk <- read_file(path)
    # contents <- paste0(frontmatter, tabs, "\n```{r}\n", chunk, "\n```\n")
    contents <- paste0(frontmatter, "\n```{r}\n", chunk, "\n```\n")
    write_file(contents, path, append=FALSE)
  }
}

setwd("new_dashboard")
rmarkdown::render_site()
setwd("../")
