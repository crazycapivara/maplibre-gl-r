#' @export
circle_style <- function(source = NULL,
                         source_layer = NULL,
                         filter = NULL,
                         circle_blur = NULL,
                         circle_color = NULL,
                         circle_opacity = NULL,
                         circle_pitch_alignment = NULL,
                         circle_pitch_scale = NULL,
                         circle_radius = NULL,
                         circle_sort_key = NULL,
                         circle_stroke_color = NULL,
                         circle_stroke_opacity = NULL,
                         circle_stroke_width = NULL,
                         circle_translate = NULL,
                         circle_translate_anchor = NULL,
                         visibility = c("visible", "none"),
                         id = "circle-layer") {
  paint <- compact_list(
    "circle-blur" = circle_blur,
    "circle-color" = circle_color,
    "circle-opacity" = circle_opacity,
    "circle-pitch-alignment" = circle_pitch_alignment,
    "circle-pitch-scale" = circle_pitch_scale,
    "circle-radius" = circle_radius,
    "circle_sort_key" = circle_sort_key,
    "circle-stroke-color" = circle_stroke_color,
    "circle-stroke-opacity" = circle_stroke_opacity,
    "circle-stroke-width" = circle_stroke_width,
    "circle-translate" = circle_translate,
    "circle_translate_anchor" = circle_translate_anchor
  )
  layout <- compact_list(
    "circle-sort-key" = circle_sort_key,
    "visibility" = match.arg(visibility)
  )
  compact_list(
    id = id,
    type = "circle",
    source = source,
    "source-layer" = source_layer,
    filter = filter,
    paint = paint,
    layout = layout
  )
}
