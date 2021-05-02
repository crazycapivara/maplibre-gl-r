as_maplibregl <- function(.data) {
  # message("not implemented yet")
  navigation_control <- getOption("maplibregl.navigation.control", FALSE)
  message(navigation_control)

  bounds <- unname(sfheaders::sf_bbox(.data))
  map <- maplibregl(
    bounds = bounds
  ) %>%
    add_layer(data = .data, circle_style(circle_color = "green"))

  if (navigation_control) map <- map %>% add_control("NavigationControl")
  map
}
