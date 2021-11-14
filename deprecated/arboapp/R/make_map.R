#' Make map
#' @description Make a leaflet map given a dataframe with two columns: country and value
#' @return A leaflet object
#' @noRd
#' @import leaflet
#' @import dplyr
#' @import sp
make_map <- function(df,
                     pal = 'YlGnBu',
                     qualitative = FALSE,
                     opacity = 0.8){
  
 # load('../data/world_shp.rda')
 # df <- tibble(country = c('France', 'Germany', 'Spain'),
 #              value = c(1,2,3))
 # df$value <- c('A', 'b', 'CCC')
 

 # See if is regional or not
 is_regional <- 'region' %in% names(df)
 
 # See if qualitative (override logic)
 if(!qualitative){
   if(!is.numeric(df$value)){
     qualitative <- TRUE
   }
 }
 
 if(is_regional){
   if(qualitative){
     # regional, qualitative
     df <- df %>%
       group_by(region) %>%
       summarise(value = length(which(value == 'Yes')))
   } else {
     # regional, quantitative
     df <- df %>%
       group_by(region) %>%
       summarise(value = mean(value, na.rm = TRUE))
   }
 } #else {
   # if(qualitative){
   #   # non-regional, qualitative
   # 
   # } # else non-regional, quantitative, no action
   

 # Join shapefile and map data
 if(is_regional){
   shp <- region_shp
 } else {
   shp <- world_shp
 }
 shp@data <- left_join(shp@data, df)
 
 
 # Define color palette and values to show in tooltip
 if(qualitative){
   pal <- 'Set1'
   pal_fun <- colorFactor(palette = pal, domain=shp@data$value, na.color="transparent")
   vals <- shp@data$value

 } else {
   pal_fun <- colorNumeric(palette=pal, domain=shp@data$value, na.color="transparent")
   vals <- round(shp@data$value, 2)
 }
 
 # Prepare the text for tooltips:
 tool_tip <- paste(
   ifelse(is_regional, 'Region: ', "Country: "), 
   ifelse(is_regional, shp@data$region, shp@data$country),"<br/>", 
   "Value: ", vals, 
   sep="") %>%
   lapply(htmltools::HTML)
 
 m <- leaflet(shp) %>% 
   addTiles()  %>% 
   addPolygons( 
     fillColor = ~pal_fun(value), 
     stroke=TRUE, 
     fillOpacity = opacity, 
     color="white", 
     weight=0.3,
     label = tool_tip,
     labelOptions = labelOptions( 
       style = list("font-weight" = "normal", padding = "3px 8px"), 
       textsize = "13px", 
       direction = "auto"
     )
   ) %>%
   addLegend( pal=pal_fun, values=~value, opacity=0.9, title = " ", position = "bottomleft" ) %>%
   setView( lat=10, lng=0 , zoom=2) 
 m
}
