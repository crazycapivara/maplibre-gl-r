test_that("widget", {
  # Prepare

  # Act
  map <- maplibregl()

  # Assert
  expected_style <- "https://basemaps.cartocdn.com/gl/dark-matter-gl-style/style.json"
  expect_equal(map$x$mapProps$style, expected_style)
})
