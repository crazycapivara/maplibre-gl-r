## code to prepare `nyc_boroughs` dataset goes here
path <- "https://github.com/plotly/datasets/raw/master/nyc_boroughs.zip"
destfile <- "data-raw/nyc_boroughs.zip"
download.file(path, destfile)
unzip(destfile, exdir = "data-raw")
nyc_boroughs <- sf::st_read("data-raw/geo_export_d082ab44-4688-42c8-8fe8-2d5f5abe25d9.shp")
plot(nyc_boroughs)

# usethis::use_data(nyc_boroughs, overwrite = TRUE)

# "https://data.cityofnewyork.us/City-Government/Borough-Boundaries/tqmj-j8zm"
nyc_boroughs_sf <- st_read("https://data.cityofnewyork.us/api/geospatial/tqmj-j8zm?method=export&format=GeoJSON")
