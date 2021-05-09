#' @export
set_paint_property <- function(map, layer_id, property, value) {
  map %>%
    invoke_method("setPaintProperty", layerId = layer_id, property = property, value = value)
}

#' @export
set_layout_property <- function(map, layer_id, property, value) {
  map %>%
    invoke_method("setLayoutProperty", layerId = layer_id, property = property, value = value)
}

#' @export
set_filter <-function(map, layer_id, filter) {
  map %>%
    invoke_method("setFilter", layerId = layer_id, filter = filter)
}

