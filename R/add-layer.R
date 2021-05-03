#' Add a layer to the map
#' @inheritParams add_control
#' @param style The layers's style.
#' @param data (data.frame or sf object, optional) Overwrites the style's \code{source} parameter.
#' @param filter (filter expression, optional) Overwrites the style's \code{filter} parameter.
#' @export
add_layer <- function(map, style, data = NULL, filter = NULL) {
  if (!is.null(data)) {
    style$source = ml_as_source(data)
  }

  style <- utils::modifyList(compact_list(filter = filter), style)
  map %>%
    invoke_method("addLayer", style = style)
}
