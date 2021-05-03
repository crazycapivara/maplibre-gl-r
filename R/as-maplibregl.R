add_default_layer <- function(.data) {
  UseMethod("add_default_layer", sf::st_geometry(.data))
}

add_default_layer.sfc_POINT <- function(.data) {
  print(.data)
  message("point")
}

as_maplibregl <- function(.data) {
  if (!inherits(.data, "sf")) {
    stop("'data' needs to be of type 'sf'")
  }

  navigation_control <- getOption("maplibregl.navigation.control", FALSE)
  message(navigation_control)
  #add_default_layer(.data)

  bounds <- unname(sfheaders::sf_bbox(.data))
  map <- maplibregl(
    bounds = bounds
  ) %>%
    add_layer(data = .data, circle_style(circle_color = "green"))

  if (navigation_control) map <- map %>% add_control("NavigationControl")
  map
}
