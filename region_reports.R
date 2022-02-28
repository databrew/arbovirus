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

# create RMDs for dashboard
for(j in 1:length( regions )){
  region <- regions[j]
  region_path <- paste0("new_dashboard/", region, "/")
  filenames <- dir( region_path )
  filenames <- filenames[ grep("Rmd", filenames) ]
  for(k in 1:length(filenames)){
    path <- paste0(region_path, filenames[k])
    question <- unlist(strsplit( filenames[k], split=".", fixed=TRUE))[1]
    frontmatter <- read_file("chunk_frontmatter.Rmd")
    frontmatter <- paste0(frontmatter,"\n```{r}\ndata <- data %>% filter(Region=='", region, "') %>% droplevels() %>% mutate(SI01 = as.character(SI01)) %>% arrange( SI01 )\n```\n")
    chunk <- read_file(path)
    # contents <- paste0(frontmatter, "\n```{r}\n\n", chunk, "\n```\n\n")
    contents <- paste0(frontmatter, chunk)
    write_file(contents, path, append=FALSE)
  }
}

