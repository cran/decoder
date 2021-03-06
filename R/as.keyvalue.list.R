#' Coerce a list to keyvalue object
#'
#' \code{x} should be a list with properties described in section "Details".
#' 
#' \itemize{
#'    \item{All names of the list elements should be unique.}
#'    \item{All elements of the list should be named.}
#'    \item{All keys should be unique (a key should only be mappad to 
#'    one value).}
#'    \item{All elements of the list should be atomic vectors.}
#' }
#'
#' @param x a \code{list} with properties described in the details section.
#' @param  ... further arguments passed to \code{\link{as.keyvalue}}.
#' 
#' @return The function returns an object of class \code{keyvalue} 
#' (and \code{list}.
#' @export
#' @seealso \link{as.keyvalue}
#' @examples
#'
#' ex <- list(
#'  fruit  = c("banana", "orange", "kiwi"),
#'  car    = c("SAAB", "Volvo", "taxi", "truck"),
#'  animal = c("elephant")
#' )
#' as.keyvalue(ex)
#' is.keyvalue(ex)
#'
as.keyvalue.list <- function(x, ...) {
  # Tests
  if (is.null(names(x)) || "" %in% names(x)) {
    stop("All elements of x must be named (values must be given for all keys)!")
  } else if (!identical(unique(names(x)), names(x))) {
    stop("All list element names must be unique!")
  } else if (anyDuplicated(unlist(x)) > 0) {
    stop(
      "Some key(s) have duplicates! A key should only be mapped to one ",
      "value (be found in one element of the list)"
    )
  } else if (!all(vapply(x, is.atomic, logical(1)))) {
    stop("All elements of the list should be atomic!")
  }
  
  as.keyvalue(internal_as.keyvalue.list(x), ...)
}


# Helper function 
internal_as.keyvalue.list <- function(x){
  data.frame(
    key       = unlist(x),
    value     = rep(names(x), vapply(x, length, numeric(1))),
    row.names = NULL,
    stringsAsFactors = FALSE
  ) 
}
