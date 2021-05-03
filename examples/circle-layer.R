devtools::load_all()

mvc <- sf::st_as_sf(mapboxer::motor_vehicle_collisions_nyc, coords = c("lng", "lat"), crs = 4326)

LAYER_ID <- "circle-layer"

map <- maplibregl(
  bounds = unname(sfheaders::sf_bbox(mvc)),
  #center = c(-73.9165, 40.7114),
  #zoom = 10,
  pitch = 30,
  element_id = "test"
) %>%
  add_control("NavigationControl", pos = "top-left") %>%
  add_layer(
    circle_style(
      circle_color = "blue",
      id = LAYER_ID
    ),
    data = mvc,
    filter = list("==", "injured", 2)
  ) %>%
  add_tooltip(LAYER_ID, "This is a tooltip")

if (interactive()) map
