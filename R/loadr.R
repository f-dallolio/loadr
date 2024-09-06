#' Attach several packages
#'
#' @param ... package names quoted or not.
#' @param .x a vector or a list that is concatenated to `...`.
#' @param quiet If `FALSE`, the function prints output. Defaults to `TRUE`.
#'
#' @return NULL invisibly.
#' @export
#'
loadr <- function(..., .x = NULL, quiet = TRUE) {
  exprs <- rlang::enexprs(...)
  x <- format(exprs)
  if(!is.null(.x)) {
    x <- c(x, format(.x))
  }
  lapply(x, library2, quiet = quiet)
  invisible(NULL)
}
