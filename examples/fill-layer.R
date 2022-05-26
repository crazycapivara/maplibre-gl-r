devtools::load_all()

nyc_boroughs <- sf::st_read("data-raw/geo_export_d082ab44-4688-42c8-8fe8-2d5f5abe25d9.shp") %>%
  dplyr::mutate(color = substr(rainbow(nrow(.)), 1, 7))

SRC_ID <- "nyc-boroughs"

maplibregl(
  bounds = sf::st_bbox(nyc_boroughs),
  element_id = "test"
) %>%
  add_source(nyc_boroughs, id = SRC_ID) %>%
  add_layer(
    fill_layer(
      source = SRC_ID,
      fill_color = c("get", "color"),
      fill_opacity = 0.5
    )
  ) %>%
  add_layer(
    line_style(
      source = SRC_ID,
      line_color = "blue",
      line_width = 3
    )
  ) %>%
  add_tooltip("fill-layer", "{{boro_name}}")
