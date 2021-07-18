library(opendatatoronto)
library(tidyverse)
library(sf)
library(ggthemes)

# Get shape data for mapping 
nbhoods_shape = readRDS("data/neighbourhood_shapefile.Rds") %>% 
  sf::st_as_sf()

stops = read_csv("data/stops.txt")

nbhoods_shape %>%
  ggplot() +
  labs(title = "Locations of All TTC Stops in Toronto",
       subtitle = "Including buses, streetcars, and subway stations",
       caption = "Source: Open Data Toronto\nData last updated: June 8, 2021") +
  geom_sf() +
  theme_void() +
  geom_point(
    data = stops,
    aes(x = stop_lon, y = stop_lat),
    size = 0.1,
    color = '#DA251C'
  )
