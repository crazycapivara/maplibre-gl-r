#' Add a layer to the map
#' @inheritParams add_control
#' @param style The layers's style.
#' @param data (data.frame or sf object, optional) Overwrites the style's \code{source} parameter.
#' @param id (character, optional) Overwrites the style's \code{id} parameter.
#' @param ... Named arguments used to overwrite style parameters.
#' @export
add_layer <- function(map, style, data = NULL, id = NULL, ...) {
  if (!is.null(data)) {
    style$source = ml_as_source(data)
  }

  style <- utils::modifyList(compact_list(id = id, ...), style)
  map %>%
    invoke_method("addLayer", style = style)
}
