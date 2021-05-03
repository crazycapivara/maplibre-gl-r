add_tooltip <- function(map, layer_id, tooltip) {
  map %>%
    invoke_method("addTooltip", layerId = layer_id, tooltip = tooltip)
}
