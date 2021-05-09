us_cities <- data.table::fread("https://raw.githubusercontent.com/plotly/datasets/master/us-cities-top-1k.csv") %>%
  sf::st_as_sf(coords = c("lon", "lat"))

as_maplibregl(us_cities) %>%
  add_tooltip("circle-layer", "{{City}}")
