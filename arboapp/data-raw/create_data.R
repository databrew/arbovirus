library(dplyr)
library(usethis)
library(leaflet)
library(rgdal)
library(sp)
library(maptools)

# Get list of countries in the dataset
load('../dev/data/data.RData')
countries <- as.character( data$SI01)
countries <- countries[!is.na(countries)]

# Get world shapefile
data("wrld_simpl")


# See which countries have an exact match
countries %in% wrld_simpl@data$NAME
country_dict <-
  tibble(country = countries) %>%
  left_join(wrld_simpl@data %>%
              dplyr::select(NAME) %>%
              mutate(in_shp = TRUE),
            by = c('country' = 'NAME')) %>%
  filter(!is.na(in_shp)) %>%
  dplyr::select(-in_shp) %>%
  mutate(NAME = country) 


# For those which don't have an exact match, manually assign
countries[!countries %in% wrld_simpl@data$NAME]
country_dict_b <-
  tibble(country = c('Myanmar',
                     'Libya'),
         NAME = c('Burma',
                  'Libyan Arab Jamahiriya'))

country_dict <- bind_rows(country_dict, country_dict_b)
country_dict <- country_dict %>%
  dplyr::distinct(NAME, country, .keep_all = TRUE)

wrld_simpl@data$country <- as.character(NA)
for(i in 1:nrow(wrld_simpl@data)){
  message(i)
  this_name <- as.character(wrld_simpl@data$NAME)[i]
  if(this_name %in% country_dict$NAME){
    new_name <- country_dict %>%
      filter(NAME == this_name) %>%
      .$country
    new_name <- as.character(new_name)
  } else {
    new_name <- as.character(this_name)
  }

  wrld_simpl@data$country[i] <- new_name
}
world_shp <- wrld_simpl


# Make region-level map
regions_df <- readxl::read_excel('../../data/Regions_Countries_joe.xlsx')
# get region into world map
world_shp@data <- 
  left_join(world_shp@data,
            regions_df %>% dplyr::rename(country = Country)) %>%
  dplyr::rename(region = Region)

# Collapse for regions only
helper <- world_shp[!is.na(world_shp@data$region),]
region_shp <- rgeos::gUnaryUnion(spgeom = helper,
                                 id = helper@data$region)
IDs <- data.frame(ID=sapply(slot(region_shp, "polygons"), function(x) slot(x, "ID")))
rownames(IDs)  <- IDs$ID
region_shp <- SpatialPolygonsDataFrame(region_shp, IDs)

usethis::use_data(region_shp, overwrite = TRUE)
usethis::use_data(world_shp, overwrite = TRUE)
