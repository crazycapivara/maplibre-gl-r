#' @export
set_paint_property <- function(map, layer_id, property, value) {
  map %>%
    invoke_method("setPaintProperty", layerId = layer_id, property = property, value = value)
}
