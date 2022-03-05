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
  }
}
