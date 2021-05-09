#' @export
add_source <- function(map, data, id = "maplibre-src", lng = NULL, lat = NULL) {
  map %>%
    invoke_method("addSource", id = id, src = ml_as_source(data, lng, lat))
}
