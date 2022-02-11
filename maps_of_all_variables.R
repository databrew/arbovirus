source('prepare_data.R')

variables <- names(simplified_data) 
variables <- variables[!variables %in% c('1. State', 'region')]

if(!dir.exists('/home/joebrew/Desktop/who_maps/')){
  dir.create('/home/joebrew/Desktop/who_maps')
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

# Make q55 animations
this_variable <- variables[i]

map_vars <- variables[grepl('provide total number of cases and deaths', variables, fixed = TRUE)]
map_vars_clean <- unlist(lapply(strsplit(map_vars, '(if available) ', fixed = T), function(x){x[2]}))
map_vars_disease <- unlist(lapply(strsplit(map_vars_clean, '2', fixed = TRUE), function(x){x[1]}))
map_vars_type <- unlist(lapply(strsplit(map_vars_clean, ' ', fixed = TRUE), function(x){x[length(x)]}))
x <- unlist(lapply(strsplit(map_vars_clean, ' ', fixed = TRUE), function(x){x[length(x)-1]}))
map_vars_year <- as.numeric(substr(x, nchar(x)-3, nchar(x)))
map_vars_df <- 
  tibble(
    variable = map_vars,
    variable_clean = map_vars_clean,
    disease = map_vars_disease,
    type = map_vars_type,
    year = map_vars_year
  )
diseases <- sort(unique(map_vars_df$disease))
case_deaths <- c('Cases', 'Deaths')
options(scipen = 999)

# Get max value for each disease/type
max_values <- simplified_data[,1] %>% 
  bind_cols(
    simplified_data[,map_vars_df$variable]
  ) %>%
  dplyr::rename(country = `1. State`)
max_values <- max_values %>%
  tidyr::gather(key, value, names(max_values)[2]: names(max_values)[ncol(max_values)])
max_values <- left_join(max_values,
                map_vars_df,
                by = c('key' = 'variable'))
max_values <- max_values %>%
  group_by(disease, type) %>%
  summarise(value = max(value, na.rm = T))

out_dir <- '/home/joebrew/Desktop/who_animations/'
if(!dir.exists(out_dir)){
  dir.create(out_dir)
}
out_list <- list()
counter <- 0
for(j in 1:length(case_deaths)){
  for(i in 1:length(diseases)){
    this_type <- case_deaths[j]
    this_disease <- diseases[i]
    # Get data
    map_vars_df_sub <- map_vars_df %>%
      filter(disease == this_disease,
             type == this_type)
    
    pd <- simplified_data[,1] %>% 
      bind_cols(
        simplified_data[,map_vars_df_sub$variable]
      ) %>%
      dplyr::rename(country = `1. State`)
    
    # Restructure
    pd <- pd %>%
      tidyr::gather(key, value, names(pd)[2]: names(pd)[ncol(pd)])
    pd <- left_join(pd,
                    map_vars_df_sub,
                    by = c('key' = 'variable'))
    
    years <- sort(unique(pd$year))
    paly <- 'Set1'
    max_value <- max_values %>%
      filter(disease == this_disease,
             type == this_type) %>%
      .$value
    for(y in 1:length(years)){
      counter <- counter +1
      this_year <- years[y]
      out <- map_vars_df_sub %>%
        filter(year == this_year)
      file_name <- paste0(out$disease,'_', out$type, '_', out$year, '.png')
      out_list[[counter]] <- out
      this_data <- pd %>% filter(year == this_year)
      this_data <- this_data %>%
        dplyr::select(country, value)
      g <- make_map(df = this_data, qualitative = FALSE,
                    pal = paly,
                    add_base_layer = FALSE,
                    label_string = 'Number of arboviruses',
                    legend_title = 'Number of\narboviruses',
                    use_who_shp = TRUE,
                    static = TRUE,
                    remove_some = FALSE,
                    line_color = 'black') +
        theme_bw() +
        theme(legend.position = 'bottom',
              legend.key.height = unit(4, 'mm'),
              legend.key.width = unit(18, 'mm')) +
        labs(subtitle = paste0(strwrap(paste0(this_year, ' ',
                                              this_disease, ' ',
                                              this_type), width=140, simplify=TRUE), collapse = '\n'),
             x = 'Longitude',
             y = 'Latitude') +
        scale_fill_gradientn(name = '',
                             colours=rev(RColorBrewer::brewer.pal(n = 9, name = 'Spectral')),
                             na.value = "grey",
                             limits=c(0,max_value))
      g
      ggsave(paste(out_dir, file_name))
    }
  }
}
out <- bind_rows(out_list)
out$file_name <- paste0(' ', out$disease,'_', out$type, '_', out$year, '.png')
# Go through the maps and make animations
animation_dir <- paste0(out_dir, 'animations/')
if(!dir.exists(animation_dir)){
  dir.create(animation_dir)
}
for(j in 1:length(case_deaths)){
  for(i in 1:length(diseases)){
    this_type <-case_deaths[j]
    this_disease <- diseases[i]
    these_files <- out %>%
      filter(disease == this_disease,
             type == this_type)
    # Copy all files to a temporary directory
    directory_name <- paste0(out_dir, paste0(sample(letters, 10), collapse = ''), '/')
    dir.create(directory_name)
    for(k in 1:nrow(these_files)){
      file.copy(from = paste0(out_dir, these_files$file_name[k]),
                to = paste0(directory_name, k, '.png'))
    }
    owd <- getwd()
    setwd(directory_name)
    out_file <- paste0( this_disease, '_', this_type, '.gif')
    system(paste0('convert -delay 80 -loop 0 *.png ', out_file))
    file.copy(out_file, 
              paste0('../animations/', out_file))
    setwd(owd)
    unlink(directory_name, recursive = TRUE)
  }
}
