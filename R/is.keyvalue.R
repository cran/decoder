#' @rdname keyvalue
#' @export
is.keyvalue <- function(x){
    inherits(x, "keyvalue")
}

is.keyvalue11 <- function(x){
    is.keyvalue(x) && attr(x, "keyvalue11")
}
