#' @export
line_layer <- function(source = NULL,
                       source_layer = NULL,
                       filter = NULL,
                       line_blur = NULL,
                       line_cap = NULL,
                       line_color = NULL,
                       line_dasharray = NULL,
                       line_gap_width = NULL,
                       line_gradient = NULL,
                       line_join = NULL,
                       line_miter_limit = NULL,
                       line_offset = NULL,
                       line_opacity = NULL,
                       line_pattern = NULL,
                       line_round_limit = NULL,
                       line_sort_key = NULL,
                       line_translate = NULL,
                       line_translate_anchor = NULL,
                       line_width = NULL,
                       visibility = NULL,
                       popup = NULL,
                       id = "line-layer") {
  paint <- compact_list(
    "line-blur" = line_blur,
    "line-color" = line_color,
    "line-dasharray" = line_dasharray,
    "line-gap-width" = line_gap_width,
    "line-gradient" = line_gradient,
    "line-offset" = line_offset,
    "line-opacity" = line_opacity,
    "line-pattern" = line_pattern,
    "line-translate" = line_translate,
    "line-translate-anchor" = line_translate_anchor,
    "line-width" = line_width
  )
  layout <- compact_list(
    "line-cap" = line_cap,
    "line-join" = line_join,
    "line-miter-limit" = line_miter_limit,
    "line-round-limit" = line_round_limit,
    "line-sort-key" = line_sort_key,
    "visibility" = ifelse(visibility, "visible", "none")
  )
  compact_list(
    id = id,
    type = "line",
    source = source,
    "source-layer" = source_layer,
    filter = filter,
    paint = paint,
    layout = layout
  )
}

line_style <- function(...) {
  .Deprecated("line_layer")
  line_layer(...)
}
