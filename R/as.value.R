#' Coerce to key or value in objects in a key-value pair
#'
#' Functions to check if an object is a valid key or value in a keyvalue pair, 
#' or coerce it if possible.
#' @name key_and_value
#' @param x a vector
#' @return \code{as.value} returns a value-object (currently the vector itself 
#' but with class "value").
#' \code{as.key} returns a key-object (building on \code{value} but with unique 
#' entries and as character).
#' @export
as.value <- function(x) {
  stopifnot(is.atomic(x))
  structure(x, class = c("value", class(x))) 
}


#' @rdname key_and_value
#' @export
is.value <- function(x){
  inherits(x, "value")
}

