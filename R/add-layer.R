#' Add a layer to the map
#' @inheritParams add_control
#' @param style The layers's style.
#' @param filter filter expression
#' @export
add_layer <- function(map, style, filter = NULL) {
  style <- utils::modifyList(compact_list(filter = filter), style)
  map %>%
    invoke_method("addLayer", style = style)
}
