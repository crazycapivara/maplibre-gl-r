# sf points
ggplot_as_maplibregl <- function(p) {
  data <- ggplot2::ggplot_build(p)$data[[1]]
  color_column <- names(data)[grep("colour|fill", names(data))]
  as_maplibregl(st_as_sf(data), circle_color = c("get", color_column))
}
