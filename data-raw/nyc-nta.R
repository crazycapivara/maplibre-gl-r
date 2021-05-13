library(sf)

nta_sf <- st_read("https://data.cityofnewyork.us/api/geospatial/cpf4-rkhq?method=export&format=GeoJSON")
nta_pop <- data.table::fread("https://data.cityofnewyork.us/api/views/swpk-hqdp/rows.csv") %>%
  dplyr::filter(Year == 2010) %>%
  dplyr::select(ntacode = "NTA Code", pop = Population)

nta_sf %<>%
  dplyr::left_join(nta_pop, by = c("ntacode")) %>%
  dplyr::mutate(color = scales::col_quantile(c("#c2c2a3", "#d6d6c2"), pop)(pop))


# "https://data.cityofnewyork.us/City-Government/Borough-Boundaries/tqmj-j8zm"
nyc_boroughs_sf <- st_read("https://data.cityofnewyork.us/api/geospatial/tqmj-j8zm?method=export&format=GeoJSON")
