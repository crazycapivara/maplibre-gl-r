devtools::load_all()

src <- list(
  type = "geojson",
  data = geojsonsf::df_geojson(mapboxer::motor_vehicle_collisions_nyc, lon = "lng", lat = "lat")
)

style <- list(
  id = "mvc",
  type = "circle",
  source = src,
  paint = list(
    "circle-color" = "red"
  )
)

map <- maplibregl(
  center = c(-73.9165, 40.7114),
  zoom = 10,
  pitch = 30,
  element_id = "test"
) %>%
  add_control("NavigationControl", pos = "top-left") %>%
  add_layer(style, filter = list("==", "injured", 2))

if (interactive()) map
