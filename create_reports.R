
if( file.exists("data/data.RData")){
  load("data/data.RData")
} else{
  message("You need the data!")
}

for(i in 1:length( data$SI01)){
  if( !is.na( data$SI01[i] ) ){
    report_name <- paste0("reports/",data$SI01[i],".pdf")
    rmarkdown::render( "report.Rmd", params=list(country=data$SI01[i]),output_file = report_name )
  }
}
