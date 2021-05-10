devtools::load_all()

library(mapboxer)
library(sf)
library(ggplot2)

nyc_mvc <- st_as_sf(motor_vehicle_collisions_nyc, coords = c("lng", "lat"))

p <- ggplot(data = nyc_mvc) +
  geom_sf(aes(color = injured))

ggplot_as_maplibregl(p)
