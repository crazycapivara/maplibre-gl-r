#' Add a layer to the map
#' @inheritParams add_control
#' @param style The layers's style.
#' @param data (data.frame or sf) ...
#' @param filter filter expression
#' @export
add_layer <- function(map, style, data = NULL, filter = NULL) {
  if (!is.null(data)) {
    style$source = list(
      type = "geojson",
      data = geojsonsf::sf_geojson(data, simplify = FALSE)
    )
  }

  style <- utils::modifyList(compact_list(filter = filter), style)
  map %>%
    invoke_method("addLayer", style = style)
}
