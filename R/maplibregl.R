#' Create a maplibregl widget
#' @param style The map's style.
#' @param width The width of the widget.
#' @param height The height of the widget.
#' @param element_id The unique ID of the widget.
#' @param ... The properties of the map.
#' @example examples/basemap.R
#' @import htmlwidgets
#' @export
maplibregl <- function(style = "https://basemaps.cartocdn.com/gl/dark-matter-gl-style/style.json",
                       width = NULL, height = NULL, element_id = NULL, ...) {
  widgetData <- list(
    mapProps = list(style = style, ...)
  )

  htmlwidgets::createWidget(
    name = "maplibregl",
    x = widgetData,
    width = width,
    height = height,
    package = "maplibregl",
    elementId = element_id
  )
}

#' Shiny bindings for maplibregl
#'
#' Output and render functions for using maplibregl within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a maplibregl
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name maplibregl-shiny
#'
#' @export
maplibreglOutput <- function(outputId, width = "100%", height = "400px") {
  htmlwidgets::shinyWidgetOutput(outputId, "maplibregl", width, height, package = "maplibregl")
}

#' @rdname maplibregl-shiny
#' @export
renderMaplibregl <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) {
    expr <- substitute(expr)
  } # force quoted
  htmlwidgets::shinyRenderWidget(expr, maplibreglOutput, env, quoted = TRUE)
}
