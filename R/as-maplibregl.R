get_style <- function(.data) {
  UseMethod("get_style", sf::st_geometry(.data))
}

get_style.sfc_POINT <- function(.data) {
    circle_style(
      circle_color = "green"
    )
}

get_style.sfc_MULTIPOLYGON <- function(.data) {
  fill_style(
    fill_color = "yellow",
    fill_opacity = 0.5
  )
}

as_maplibregl <- function(.data) {
  if (!inherits(.data, "sf")) {
    stop("'data' needs to be of type 'sf'")
  }

  navigation_control <- getOption("maplibregl.navigation.control", FALSE)
  message(navigation_control)

  bounds <- sfheaders::sf_bbox(.data)
  map <- maplibregl(
    bounds = bounds
  ) %>%
    add_layer(get_style(.data), data = .data)

  if (navigation_control) map <- map %>% add_control("NavigationControl")
  map
}
