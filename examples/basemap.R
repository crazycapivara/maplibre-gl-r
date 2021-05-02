map <- maplibregl(
  center = c(-73.9165, 40.7114),
  zoom = 10,
  pitch = 30,
  element_id = "test"
)

if (interactive()) map
