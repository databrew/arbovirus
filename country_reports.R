
if( file.exists("data/data.RData")){
  load("data/data.RData")
} else{
  message("You need the data!")
}

countries <- data$SI01

if(!dir.exists('country_reports')){
  dir.create('country_reports')
}

for(i in 1:length( countries )){
  nom <- countries[i]
  if( !is.na( nom ) ){
    report_name <- paste0("country_reports/",nom,".pdf")
    rmarkdown::render( "country.Rmd", 
                       params=list(country=nom), 
                       output_file = report_name )
  }
}
