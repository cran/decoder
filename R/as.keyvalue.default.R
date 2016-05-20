

#' @export
#' @rdname keyvalue
as.keyvalue.default <- function(x, y, ...){
    
    stopifnot(is.atomic(x))
    if (!missing(y)) stopifnot(is.atomic(y))
    
    ## If only x supplied, x should be a named vector
    if (missing(y)){
        if (is.null(names(x)) || any(names(x) == "")){
            stop("All elements of vector 'x' must be named!")
        }
        y <- names (x)   
    }
    
    df <- data.frame(key = x, value = y, row.names = NULL)
    as.keyvalue(df, ...)
}
