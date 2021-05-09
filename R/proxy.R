#' @export
maplibreglProxy <- function(shiny_id, session = shiny::getDefaultReactiveDomain()) {
  if (!is.null(session$ns) &&
      nzchar(session$ns(NULL)) &&
      substring(shiny_id, 1, nchar(session$ns(""))) != session$ns("")) {
    shiny_id <- session$ns(shiny_id)
  }

  list(
    session = session,
    id = shiny_id,
    x = list(
      calls = list()
    )
  )
}

#' @export
updateMaplibregl <- function(proxy) {
  proxy$session$sendCustomMessage(
    type = "maplibregl",
    message <- list(
      id = proxy$id,
      widgetData = proxy$x
    )
  )
}
