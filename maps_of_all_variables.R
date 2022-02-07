source('prepare_data.R')

variables <- names(simplified_data) 
variables <- variables[!variables %in% c('1. State', 'region')]

if(!dir.exists('~/Desktop/who_maps/')){
  dir.create('~/Desktop/who_maps')
}

# For each variable, map
for(i in 1:length(variables)){
  this_variable <- variables[i]
  pd <- simplified_data[,1] %>% 
    bind_cols(
      tibble(value = unlist(simplified_data[,this_variable]))
    ) %>%
    dplyr::rename(country = `1. State`)
  # See if wualitative or not
  qualy <- class(pd$value) == 'character' | class(pd$value) == 'factor'
  if(qualy){
    paly <- 'Spectral'
  } else {
    paly <- 'Set1'
  }
  g <- make_map(df = pd, qualitative = qualy,
           pal = paly,
           add_base_layer = FALSE,
           label_string = 'Number of arboviruses',
           legend_title = 'Number of\narboviruses',
           use_who_shp = TRUE,
           static = TRUE,
           remove_some = FALSE) +
    theme_bw() +
    theme(legend.position = 'bottom') +
    labs(subtitle = paste0(strwrap(variables[i], width=140, simplify=TRUE), collapse = '\n'),
         x = 'Longitude',
         y = 'Latitude') 
  ggsave(filename = paste0('~/Desktop/who_maps/', variables[i], '.png'),
         plot = g,
         width = 9,
         height = 7)
}

# library(HatchedPolygons)
library(ggpattern)

# Q5 combined virus map – based on the csv file you sent, please could you generate a map for each region indicating the overlapping presence of the 4 viruses?  This could be done in a similar style to the earlier map Diana had sent with shading, cross hatching, dots etc. to signify each of the four viruses.

# Get data for each disease

pd <- q5[,1:5]
names(pd) <- gsub('5. ', '', names(pd))
names(pd) <- unlist(lapply(strsplit(names(pd), ' '), function(x){x[1]}))
names(pd)[1] <- 'country'  
pd <- pd %>% left_join(simplified_data %>% dplyr::select(region, country = `1. State`))
save(pd, world_shp, file = '~/Desktop/anamap.RData')


pd$total <- apply(pd[,2:5], 1, function(x){sum(ifelse(x == 'No', 0, ifelse(x == 'Yes', 1, NA)))})
# pd$value <- ifelse(pd$val > 0, 'Yes', 'No')
pd$value <- pd$total

# Clean up a bit
pd <- pd %>%
  filter(!is.na(country)) %>%
  filter(country != 'Iceland') %>%
  filter(!duplicated(country)) %>%
  mutate(value = total)

# Make markers for each disease
library(leaflet)
iconWidth = 12
iconHeight = 12
icons_chikungunya <- awesomeIcons(
  icon = NULL,
  text = 'C',
  # icon = 'copyright-mark',
  iconColor = 'black',
  markerColor = 'lightgray'
)
icons_dengue <- awesomeIcons(
  # icon = 'leaf',
  text = 'D',
  squareMarker = TRUE,
  iconColor = 'black',
  markerColor = 'gray'
)
icons_yellow_fever <- awesomeIcons(
  # icon = 'star-empty',
  text = 'Y',
  # iconRotate = 45,
  squareMarker = FALSE,
  iconColor = 'black',
  markerColor = 'orange'
)
icons_zika <- awesomeIcons(
  # icon = 'fire',
  text = 'Z',
  squareMarker = TRUE,
  iconColor = 'black',
  markerColor = 'lightgreen'
)
joined <- world_shp
joined@data <- left_join(joined@data, pd %>% dplyr::select(-region))
disease_names <- names(pd)[2:5]
for(j in 1:length(disease_names)){
  this_disease_name <- disease_names[j]
  vals <- joined@data[,this_disease_name]
  vals <- ifelse(is.na(vals), 'No', vals)
  joined@data[,this_disease_name] <- vals
}
library(sp)
coords <- coordinates(joined)
joined <- joined@data
joined$lng <- coords[,1]; joined$lat <- coords[,2]
jitter_factor <- 0.5
pd_chikungunya <- joined[joined$Chikungunya == 'Yes',] #%>% mutate(lng = jitter(lng, factor = jitter_factor), lat = jitter(lat, factor = jitter_factor))
pd_dengue <- joined[joined$Dengue == 'Yes',] %>% mutate(lng = lng + jitter_factor, lat = lat + 0) #  mutate(lng = jitter(lng, factor = jitter_factor), lat = jitter(lat, factor = jitter_factor))
pd_yellow_fever <- joined[joined$`Yellow` == 'Yes',] %>% mutate(lng = lng - jitter_factor, lat = lat + jitter_factor)  #mutate(lng = jitter(lng, factor = jitter_factor), lat = jitter(lat, factor = jitter_factor))
pd_zika <- joined[joined$Zika == 'Yes',] %>% mutate(lng = lng + jitter_factor, lat = lat - jitter_factor)#mutate(lng = jitter(lng, factor = jitter_factor), lat = jitter(lat, factor = jitter_factor))
pd$region <- NULL




l <- make_map(df = pd,
              pal = 'Spectral',
              qualitative = TRUE,
              add_base_layer = FALSE,
              label_string = 'Number of arboviruses',
              legend_title = 'Number of\narboviruses',
              use_who_shp = TRUE) %>%
  addTiles(group = 'OSM (default)') %>%
  addProviderTiles(providers$Stamen.Toner, group = "Toner") %>%
  addProviderTiles(providers$Stamen.TonerLite, group = "Toner Lite") %>%
  addAwesomeMarkers(data = pd_chikungunya, 
                    ~lng, 
                    ~lat, 
                    icon=icons_chikungunya, 
                    label=paste0(pd_chikungunya$country, '. ', 'Chikungunya'),
                    group = 'Chikungunya') %>%
  addAwesomeMarkers(data = pd_dengue, 
                    ~lng, 
                    ~lat, 
                    icon=icons_dengue, 
                    label=paste0(pd_dengue$country, '. ', 'Dengue'),
                    group = 'Dengue') %>%
  addAwesomeMarkers(data = pd_yellow_fever, 
                    ~lng, 
                    ~lat, 
                    icon=icons_yellow_fever, 
                    label=paste0(pd_yellow_fever$country, '. ', 'Yellow fever'),
                    group = 'Yellow fever') %>%
  addAwesomeMarkers(data = pd_zika, 
                    ~lng, 
                    ~lat, 
                    icon=icons_zika, 
                    label=paste0(pd_zika$country, '. ', 'Zika'),
                    group = 'Zika') %>%
  addLayersControl(
    baseGroups = c("OSM (default)", "Toner", "Toner Lite"),
    overlayGroups = c("Chikungunya", "Dengue", "Yellow fever", "Zika"),
    options = layersControlOptions(collapsed = FALSE)
  ) %>%    addFullscreenControl()
l
dir.create('~/Documents/databrew.github.io/whoarbq5')
htmltools::save_html(l, file = '~/Documents/databrew.github.io/whoarbq5/index.html')


# Get ggplot2 version
shp_sp <- as(shp, 'Spatial')
shp_sp <- maptools::pruneMap(shp_sp)
shpf <- fortify(shp_sp, region = 'country')
shpf$country <- shpf$id
shpf <- left_join(shpf, shp_sp@data)
shpfl <- tidyr::gather(shpf, key, value, Chikungunya:Zika)

library(ggthemes)
ggplot(data = shpfl,
       aes(x = long,
           y = lat,
           group = group)) +
  geom_polygon(aes(fill = value),
               color = 'black',
               size = 0.5,
               alpha = 0.6) +
  facet_wrap(~key) +
  # coord_map() +
  scale_fill_manual(name = '',
                     values = c('lightblue', 'darkred'),
                    na.value = 'lightgrey') +
  theme_map()
ggsave('~/Desktop/map2.png', height = 8, width = 10)

regions <- sort(unique(shp_sp@data$who_region))
for(r in 1:length(regions)){
  this_region <- regions[r]
  message(this_region)
  ggplot(data = shpfl %>% filter(who_region == this_region),
         aes(x = long,
             y = lat,
             group = group)) +
    geom_polygon(aes(fill = value),
                 color = 'black',
                 size = 0.5,
                 alpha = 0.6) +
    facet_wrap(~key) +
    # coord_map() +
    scale_fill_manual(name = '',
                      values = c('lightblue', 'darkred'),
                      na.value = 'lightgrey') +
    theme_map()
  ggsave(paste0('~/Desktop/map2_', this_region, '.png'), height = 8, width = 10)
}

# Ggplot with symbology

# Get centroids
centroids <- coordinates(as(shp, 'Spatial'))
centroids <- data.frame(centroids)
names(centroids) <- c('lng', 'lat')
centroids <- bind_cols(
  centroids,
  shp %>%
    data.frame() %>%
    dplyr::select('country', 'Chikungunya', 'Dengue', 'Yellow', 'Zika')
)
centroids$label <- 
  paste0(
    ifelse(is.na(centroids$Chikungunya), '', ifelse(centroids$Chikungunya == 'Yes', 'C', '')),
    ifelse(is.na(centroids$Dengue), '', ifelse(centroids$Dengue == 'Yes', 'D', '')),
    # '\n',
    ifelse(is.na(centroids$Yellow), '', ifelse(centroids$Yellow == 'Yes', 'Y', '')),
    ifelse(is.na(centroids$Zika), '', ifelse(centroids$Zika == 'Yes', 'Z', '')),
    collapse = NULL
  )
centroids <- centroids %>%
  filter(label != '\n',
         label != '')
centroids <- centroids %>%
  left_join(shp_sp@data %>% dplyr::select(country, who_region))

library(ggrepel)
cols <- rev(RColorBrewer::brewer.pal(n = 5, 'Spectral'))
ggplot() +
  geom_polygon(data = shpf %>% mutate(total = factor(total)),
               aes(x = long,
                   y = lat,
                   group = group,
                   fill = total),
               color = 'black',
               alpha = 0.6,
               size = 0.3) +
  geom_text(data = centroids,
            aes(x = lng,
                y = lat,
                label = label),
            size = 2,
            alpha = 0.8) +
  scale_fill_manual(name = '',
                    values = cols) +
  theme_map()
ggsave('~/Desktop/map3.png', height = 8, width = 10)

regions <- sort(unique(shp_sp@data$who_region))
for(r in 1:length(regions)){
  this_region <- regions[r]
  message(this_region)
  cols <- rev(RColorBrewer::brewer.pal(n = 5, 'Spectral'))
  ggplot() +
    geom_polygon(data = shpf %>% mutate(total = factor(total)) %>%
                   filter(who_region == this_region),
                 aes(x = long,
                     y = lat,
                     group = group,
                     fill = total),
                 color = 'black',
                 alpha = 0.6,
                 size = 0.3) +
    geom_text(data = centroids %>% filter(who_region == this_region),
              aes(x = lng,
                  y = lat,
                  label = label),
              size = 2,
              alpha = 0.8) +
    scale_fill_manual(name = '',
                      values = cols) +
    theme_map()
  ggsave(paste0('~/Desktop/map3_', this_region, '.png'), height = 8, width = 10)
}

cols <- rev(RColorBrewer::brewer.pal(n = 5, 'Spectral'))
ggplot() +
  geom_polygon(data = shpf %>% mutate(total = factor(total)),
               aes(x = long,
                   y = lat,
                   group = group,
                   fill = total),
               color = 'black',
               alpha = 0.6,
               size = 0.3) +
  geom_text(data = centroids,
            aes(x = lng,
                y = lat,
                label = label),
            size = 2,
            alpha = 0.8) +
  scale_fill_manual(name = '',
                    values = cols) +
  theme_map() +
  facet_wrap(~who_region, scales = 'free')
ggsave('~/Desktop/map3_paneled.png', height = 8, width = 14)

# # Q 34
# Make two choropleth maps:
#   1. For question 34b (Aedes aegypti)
# 2. For question 34c (Aedes albopictus)
# 
# These should be similar to the attached (But do not need to copy the style exactly - just to give an idea).
# 
# The colors should reflect the magnitude of the risk level (ie “populations abundant and arboviruses circulating…” through to “occasionally found and pose no significant threat…”)
# 
# Once global maps are done, make one map for each question for each region (use region column)
q34a <- simplified_data %>%
  dplyr::select(country = `1. State`,
                region)
q34b <- simplified_data[,grepl('34', names(simplified_data)) & grepl('choose', names(simplified_data)) & grepl('Please', names(simplified_data)) & !grepl('34.', names(simplified_data), fixed = T)]
q34 <- bind_cols(q34a, q34b)
names(q34)[3:4] <- c('aegypti', 'albopictus')
# Join to spatial
shp <- who_shp$adm0
shp$country <- shp$adm0_viz_n
shp <- left_join(shp, q34 %>% dplyr::select(-region))
shp_sp <- as(shp, 'Spatial')
shp_sp <- maptools::pruneMap(shp_sp)
shpf <- fortify(shp_sp, region = 'country')
shpf$country <- shpf$id
shpf <- left_join(shpf, shp_sp@data)

# Factor levels
shpf$aegypti <- factor(shpf$aegypti,
                       levels = c("Aedes aegypti mosquitoes are only occasionally found and do not pose a significant public health threat",
                                  "Aedes aegypti populations are restricted to few sites and do not yet pose a significant threat",
                                  "Aedes aegypti populations are stable in select areas and pose a significant threat",
                                  "Aedes aegypti populations are spreading and pose a significant public health threat",
                                  "Aedes aegypti populations are abundant and arbovirus(es) is (are) circulating"))
shpf$albopictus <- 
  factor(shpf$albopictus,
         levels = c("Aedes albopictus mosquitoes are only occasionally found and do not pose a significant public health threat",
                    "Aedes albopictus populations are restricted to few sites and do not yet pose a significant threat",
                    "Aedes albopictus populations are stable in select areas and pose a significant threat",
                    "Aedes albopictus populations are spreading and pose a significant public health threat",
                    "Aedes albopictus populations are abundant and arbovirus(es) is (are) circulating"))


# Map
cols <- rev(RColorBrewer::brewer.pal(n = 5, 'Spectral'))
ggplot() +
  geom_polygon(data = shpf,
               aes(x = long,
                   y = lat,
                   group = group,
                   fill = aegypti),
               color = 'black',
               alpha = 0.6,
               size = 0.3) +
  scale_fill_manual(name = '',
                    values = cols) +
  theme_map() +
  guides(fill=guide_legend(ncol=2,byrow=FALSE))
ggsave('~/Desktop/map4_aegypti.png', height = 7, width = 10)


regions <- sort(unique(shp_sp@data$who_region))
for(r in 1:length(regions)){
  this_region <- regions[r]
  message(this_region)

  g <- ggplot() +
    geom_polygon(data = shpf %>% filter(who_region == this_region),
                 aes(x = long,
                     y = lat,
                     group = group,
                     fill = aegypti),
                 color = 'black',
                 alpha = 0.6,
                 size = 0.3) +
    scale_fill_manual(name = '',
                      values = cols) +
    theme_map() +
    guides(fill=guide_legend(ncol=2,byrow=FALSE))
  if(this_region == 'WPRO'){
    g <- g + coord_sf(xlim = c(70, 180), expand = FALSE) 
  }
  ggsave(paste0('~/Desktop/map4_aegypti_', this_region, '.png'), height = 7, width = 10)
}

# Map
cols <- rev(RColorBrewer::brewer.pal(n = 5, 'Spectral'))
ggplot() +
  geom_polygon(data = shpf,
               aes(x = long,
                   y = lat,
                   group = group,
                   fill = albopictus),
               color = 'black',
               alpha = 0.6,
               size = 0.3) +
  scale_fill_manual(name = '',
                    values = cols) +
  theme_map() +
  guides(fill=guide_legend(ncol=2,byrow=FALSE))
ggsave('~/Desktop/map5_albopictus.png', height = 7, width = 10)


regions <- sort(unique(shp_sp@data$who_region))
for(r in 1:length(regions)){
  this_region <- regions[r]
  message(this_region)
  ggplot() +
    geom_polygon(data = shpf %>% filter(who_region == this_region),
                 aes(x = long,
                     y = lat,
                     group = group,
                     fill = albopictus),
                 color = 'black',
                 alpha = 0.6,
                 size = 0.3) +
    scale_fill_manual(name = '',
                      values = cols) +
    theme_map() +
    guides(fill=guide_legend(ncol=2,byrow=FALSE))
  ggsave(paste0('~/Desktop/map5_albopictus_', this_region, '.png'), height = 7, width = 10)
}


# Join to spatial
shp <- who_shp$adm0
shp$country <- shp$adm0_viz_n
shp <- left_join(shp, pd)

# Get centroids
centroids <- coordinates(as(shp, 'Spatial'))
centroids <- data.frame(centroids)
names(centroids) <- c('lng', 'lat')
centroids <- bind_cols(
  centroids,
  shp %>%
    data.frame() %>%
    dplyr::select('country', 'Chikungunya', 'Dengue', 'Yellow', 'Zika')
)
centroids <- tidyr::gather(centroids, key, value, Chikungunya:Zika) %>%
  filter(!is.na(value)) %>%
  filter(value == 'Yes')

shp_sp <- as(shp, 'Spatial')
# Subset to just a few countries
keep_countries <- sort(unique(shp_sp@data$country[shp_sp@data$region == 'PAHO']))

sub_shp_sp <- shp_sp[shp_sp@data$country %in% keep_countries,]
sub_shp_sp <- sub_shp_sp[sub_shp_sp@data$Yellow == 'Yes',]
shpf <- fortify(sub_shp_sp, region = 'country')
shp_data <- sub_shp_sp@data


p <- ggplot(shp_data, aes(map_id = country)) +
  geom_map_pattern(
    map = shpf,
    aes(
      pattern_type = Yellow
    ),
    pattern              = 'magick',
    pattern_fill         = 'black',
    pattern_aspect_ratio = 1.75,
    fill                 = 'white',
    colour               = 'black',
  ) +
  # expand_limits(x = states_map$long, y = states_map$lat) +
  coord_map() +
  theme_bw(18) +
  labs(title = "ggpattern::geom_map_pattern()") + 
  labs(
    title = "ggpattern::geom_map_pattern()",
    subtitle = "pattern = 'magick'"
  ) + 
  scale_pattern_type_discrete(choices = gridpattern::names_magick) +
  theme(legend.position = 'none')

p

g