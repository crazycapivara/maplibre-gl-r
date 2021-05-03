#' Create a data source
#' @param data A data.frame containing geo coords or an sf object.
#' @param lng,lat The column names containing the longitudes and latitudes
#'   if \code{data} is of type \code{data.frame}.
#' @param ... Optional parameters.
#' @export
ml_as_source <- function(data, lng = NULL, lat = NULL, ...) {
  list(
    type = "geojson",
    data = as_geojson(data),
    ...
  )
}

as_geojson <- function(data, ...) {
  UseMethod("as_geojson")
}

as_geojson.sf <- function(data, ...) {
  geojsonsf::sf_geojson(data, simplify = FALSE)
}

as_geojson.data.frame <- function(data, lng = NULL, lat = NULL) {
  if (is.null(lng)) lng = names(data)[grep("lng|long|lon|longitude", names(data))]
  if (is.null(lat)) lat = names(data)[grep("lat|latitude", names(data))]

  geojsonsf::df_geojson(data, lon = lng, lat = lat, simplify = FALSE)
}
