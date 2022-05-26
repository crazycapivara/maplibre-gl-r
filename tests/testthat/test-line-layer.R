test_that("line layer", {
  # Prepare

  # Act
  layer <- line_layer()

  # Assert
  expect_equal(layer$type, "line")
})
