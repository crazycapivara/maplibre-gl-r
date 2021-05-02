map <- maplibregl(
  center = c(-73.9165, 40.7114),
  zoom = 10,
  pitch = 30,
  element_id = "test"
) %>%
  add_control("NavigationControl", pos = "top-left") %>%
  add_control("ScaleControl")

if (interactive()) map
