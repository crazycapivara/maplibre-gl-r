library(shiny)

COLORS <- wesanderson::wes_palettes$BottleRocket1

nyc_boroughs <- sf::st_read("../data-raw/geo_export_d082ab44-4688-42c8-8fe8-2d5f5abe25d9.shp")

view <- basicPage(
  selectInput("boro", "boro", choices = nyc_boroughs$boro_name),
  selectInput("color", "color", choices = COLORS),
  checkboxInput("visible", "visible", value = TRUE),
  maplibreglOutput("map")
)

backend <- function(input, output) {
  output$map <- renderMaplibregl(
    as_maplibregl(nyc_boroughs)
  )

  observeEvent(list(input$color, input$visible, input$boro), {
    print(input$color)
    print(input$visible)
    print(input$boro)
    maplibreglProxy("map") %>%
      #set_paint_property("fill-layer", "fill-color", input$color) %>%
      #set_layout_property("fill-layer", "visibility", ifelse(input$visible, "visible", "none")) %>%
      set_filter("fill-layer", c("==", "boro_name", input$boro)) %>%
      updateMaplibregl()
  })
}

if (interactive()) shinyApp(view, backend)
