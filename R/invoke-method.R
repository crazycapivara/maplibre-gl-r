invoke_method <- function(.map, .name, ...) {
  pos <- length(.map$x$calls) + 1
  .map$x$calls[[pos]] <- list(
    methodName = .name,
    args = list(...) %>%
      purrr::compact()
  )
  .map
}
