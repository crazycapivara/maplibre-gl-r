devtools::load_all()

nyc_boroughs <- sf::st_read("data-raw/geo_export_d082ab44-4688-42c8-8fe8-2d5f5abe25d9.shp") %>%
  dplyr::mutate(color = substr(rainbow(nrow(.)), 1, 7))

maplibregl(
  bounds = sf::st_bbox(nyc_boroughs)
) %>%
  add_layer(
    data = nyc_boroughs,
    fill_style(
      fill_color = c("get", "color"),
      fill_opacity = 0.5
    )
  ) %>%
  add_tooltip("fill-layer", "{{boro_name}}")
