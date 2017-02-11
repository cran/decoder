#' @export
#' @rdname keyvalue
as.keyvalue.data.frame <- function(x, standard_var_names = NULL, ...){
  
  if (ncol(x) != 2 || !all((c("key", "value") %in% names(x)))) {
    stop("A keyvalue object must have exactly two columns: 'key' and 'value'!")
  }
  
  x <- x[order(x$key),]
  
  x$value <- as.value(x$value)
  x$key   <- as.key(x$key)
  
  class(x) <- c("keyvalue", "data.frame")
  attr(x, "standard_var_names") <- standard_var_names
  
  ## If there is a 1:1-relation between the key and the value, 
  ## this is declared in an extra attribute
  if (!inherits(try(as.key(x$value), silent = TRUE), "try-error")) {
    x$value  <- as.key(x$value)
    attr(x, "keyvalue11") <- TRUE
  } else{
    attr(x, "keyvalue11") <- FALSE
  }
  
  x
}
