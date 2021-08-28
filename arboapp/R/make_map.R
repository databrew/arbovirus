#' Make map
#' @description Make a leaflet map given a dataframe with two columns: country and value
#' @return A leaflet object
#' @noRd
#' @import leaflet
#' @import dplyr
#' @import sp
make_map <- function(df,
                     pal = 'YlGnBu',
                     opacity = 0.8){
 load('../data/world_shp.rda')
 df <- tibble(country = c('France', 'Germany', 'Spain'),
              value = c(1,2,3))
 
 # Join shapefile and map data
 shp <- world_shp
 shp@data <- left_join(shp@data, df)
 
 pal_fun <- colorNumeric(palette=pal, domain=shp@data$value, na.color="transparent")
 
 # Prepare the text for tooltips:
 mytext <- paste(
   "Country: ", shp@data$country,"<br/>", 
   "Value: ", round(shp@data$value, 2), 
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
     label = mytext,
     labelOptions = labelOptions( 
       style = list("font-weight" = "normal", padding = "3px 8px"), 
       textsize = "13px", 
       direction = "auto"
     )
   ) %>%
   addLegend( pal=mypalette, values=~value, opacity=0.9, title = " ", position = "bottomleft" ) %>%
   setView( lat=10, lng=0 , zoom=2) 
 
 
 m

}
