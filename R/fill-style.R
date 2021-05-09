#' @export
fill_style <- function(
  source = NULL,
  source_layer = NULL,
  filter = NULL,
  fill_antialias = TRUE,
  fill_color = NULL,
  fill_opacity = NULL,
  fill_outline_color = NULL,
  fill_pattern = NULL,
  fill_sort_key = NULL,
  fill_translate = NULL,
  fill_translate_anchor = NULL,
  visibility = TRUE,
  popup = NULL,
  id = "fill-layer") {
  paint <- compact_list(
    "fill-antialias" = fill_antialias,
    "fill-color" = fill_color,
    "fill-opacity" = fill_opacity,
    "fill-outline-color" = fill_outline_color,
    "fill-pattern" = fill_pattern,
    "fill-translate" = fill_translate,
    "fill-translate-anchor" = fill_translate_anchor
  )
  layout <- compact_list(
    "fill-sort-key" = fill_sort_key,
    "visibility" = ifelse(visibility, "visible", "none")
  )
  compact_list(
    id = id,
    type = "fill",
    source = source,
    "source-layer" = source_layer,
    filter = filter,
    paint = paint,
    layout = layout
  )
}
