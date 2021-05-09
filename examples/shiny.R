library(shiny)

COLORS <- wesanderson::wes_palettes$BottleRocket1

nyc_boroughs <- sf::st_read("../data-raw/geo_export_d082ab44-4688-42c8-8fe8-2d5f5abe25d9.shp")

view <- basicPage(
  selectInput("color", "color", choices = COLORS),
  maplibreglOutput("map")
)

backend <- function(input, output) {
  output$map <- renderMaplibregl(
    as_maplibregl(nyc_boroughs)
  )

  observeEvent(input$color, {
    print(input$color)
    maplibreglProxy("map") %>%
      set_paint_property("fill-layer", "fill-color", input$color) %>%
      updateMaplibregl()
  })
}

if (interactive()) shinyApp(view, backend)
