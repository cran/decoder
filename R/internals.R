#' Pad leading zeros to character
#' 
#' @param x character or object that can be coerced to such
#' @param n desired length of outcome vector
#'
#' @return Character vector of length \code{n}
pad0 <- function(x, n) {
    n <- pmax(0, n - nchar(x))
    zeroes <- vapply(n, function(l) paste(rep("0", l), collapse = ""), character(1))
    paste0(zeroes, as.character(x))
}
