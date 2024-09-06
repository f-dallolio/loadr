#' Attach package
#'
#' @param x a string indicating the name of the package to attach.
#' @param ... objects passed to `library` or `pak::pkg_install`.
#' @param quiet If `FALSE`, the function prints output. Defaults to `TRUE`.
#'
#' @return NULL invisibly.
#' @export
#'
library2 <- function(x, ..., quiet = TRUE){
  x <- format(x)
  if(rlang::is_installed(x)){
    library(x, character.only = TRUE)
    cat("Package", dQuote(x, q = FALSE), "attached\n")
  } else {
    capture.output(pak::pak_cleanup(force = TRUE))
    pkg_install <- pak::pkg_install
    if(quiet){
      pkg_install <- function(x, ...) capture.output(pak::pkg_install(x, ...))
    }
    cat("\nInstalling package ", dQuote(x, q = FALSE), "... ")
    pkg_install(x, ...)
    cat("DONE!","\n")
    library2(x, ...)
  }
  invisible(NULL)
}
