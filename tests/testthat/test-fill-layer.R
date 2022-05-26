test_that("fill layer", {
  # Prepare

  # Act
  layer <- fill_layer()

  # Assert
  expect_equal(layer$type, "fill")
})
