#' Add a control to the map
#' @param map A \link{maplibregl} object.
#' @param control_name The name of the control.
#' @param ... options
#' @param pos The position of the control.
#' @export
add_control <- function(map,
                        control_name = c("NavigationControl", "ScaleControl", "FullscreenControl"),
                        ...,
                        pos = NULL) {
  control_name <- match.arg(control_name)
  map %>%
    invoke_method("addControl", name = control_name, pos = pos, options = list(...))
}
