#' Add a layer to the map
#' @inheritParams add_control
#' @param style The layers's style.
#' @export
add_layer <- function(map, style) {
  map %>%
    invoke_method("addLayer", style = style)
}
