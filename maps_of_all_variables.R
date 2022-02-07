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
  ggsave(filename = paste0('~/Desktop/who_maps/', i, '.png'),
         plot = g,
         width = 10.5,
         height = 7)
}
