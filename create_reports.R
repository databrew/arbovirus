
# Need to investigate problems with the following countries:
# Greece, i=9 
# China, i=17
# Iraq, i=47
# Unicode issues???

if( file.exists("data/data.RData")){
  load("data/data.RData")
} else{
  message("You need the data!")
}

countries <- data$SI01

for(i in 1:length( countries )){
  
  nom <- countries[i]
  if( !is.na( nom ) ){
    report_name <- paste0("reports/",nom,".pdf")
    rmarkdown::render( "report.Rmd", params=list(country=nom),output_file = report_name )
  }
}
