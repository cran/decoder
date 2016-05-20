

#' @rdname key_and_value
#' @export
as.key <- function(x){
    
    if (!is.atomic(x)) stop(gettextf("cannot coerce class \"%s\" to a value object", deparse(class(x))), domain = NA)
    
    # We have the same requirements for key as for values but the key must also be unique and coerced to character.
    x <- as.value(as.character(x))
    if (anyDuplicated(x) != 0) stop("All keys must be unique!")
    
    class(x) <- unique(c("key", class(x)))
    x
}


#' @rdname key_and_value
#' @export
is.key <- function(x){
    inherits(x, "key")
}

