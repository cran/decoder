#' @rdname key_and_value
#' @export
as.key <- function(x){
  
  if (!is.atomic(x)) 
    stop("cannot coerce class ", deparse(class(x)), " to a key object")
  
  # We have the same requirements for key as for values but 
  # the key must also be unique and coerced to character.
  x <- as.value(as.character(x))
  if (anyDuplicated(x) != 0) stop("All keys must be unique!")
  
  structure(x, class = unique(c("key", class(x))))
}


#' @rdname key_and_value
#' @export
is.key <- function(x){
  inherits(x, "key")
}

