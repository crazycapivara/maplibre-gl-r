PROVIDERS <- list(
  carto = list(
    url = "https://basemaps.cartocdn.com/gl/%s-gl-style/style.json",
    themes = c("dark-matter", "voyager", "positron")
  )
  #, mapbox = list(
  #  url = "mapbox://styles/mapbox/%s",
  #  themes = c("streets-v11", "outdoors-v11", "light-v10", "dark-v10", "satellite-v9", "satellite-steets-v11")
  #)
)

build_urls <- function(provider) {
  urls <- list()
  for (theme in provider$themes) {
    urls[[gsub("-", "_", theme)]] <- sprintf(provider$url, theme)
  }

  urls
}

basemaps <- lapply(PROVIDERS, build_urls)
usethis::use_data(basemaps, overwrite = TRUE)
