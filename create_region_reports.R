
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
for(i in 1:length( regions )){
  nom <- regions[i]
  if( !is.na( nom ) ){
    report_name <- paste0("region_reports/",nom,".html")
    rmarkdown::render( "region_report.Rmd", 
                       params=list(region=nom), 
                       output_file = report_name )
    rmarkdown::render( "region_chunks.Rmd", 
                       params=list(region=nom))
  }
}

# create RMDs for dashboard
for(i in 1:length( regions )){
  region <- regions[i]
  filenames <- dir("dashboard")[ grep(region, dir("dashboard")) ]
  for(j in 1:length(filenames)){
    path <- paste0("dashboard/",filenames[j])
    frontmatter <- read_file( paste0("dashboard/region_chunk_frontmatter.Rmd"))
    frontmatter <- paste0(frontmatter,"\n```{r}\ndata <- data %>% filter(Region==", region, ")\n```\n")
    tabs <- read_file( paste0("dashboard/", region, ".html"))
    chunk <- read_file(path)
    contents <- paste0(frontmatter, tabs, "\n```{r}\n", chunk, "\n```\n")
    write_file(contents, path, append=FALSE)
  }
}
