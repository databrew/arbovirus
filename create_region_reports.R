
if( file.exists("data/data.RData")){
  load("data/data.RData")
} else{
  message("You need the data!")
}

regions <- levels( data$Region )

if(!dir.exists('region_reports')){
  dir.create('region_reports')
}

for(i in 1:length( regions )){
  nom <- regions[i]
  if( !is.na( nom ) ){
    report_name <- paste0("region_reports/",nom,".html")
    rmarkdown::render( "region_report.Rmd", 
                       params=list(region=nom), 
                       output_file = report_name )
  }
}
