#' @export
#' @rdname decode
decode.default <- function(x, keyvalue, extra_functions = NULL, 
                           exact = FALSE, ...) {
  
  stopifnot(is.atomic(x))
  if (all(is.na(x))) return(x)
  
  original_x <- x
  keyvalue <- as.keyvalue(keyvalue)
  
  if (!exact) {
    transformed <- format_as_key(x, keyvalue)
    x <- transformed$x
    keyvalue <- transformed$keyvalue
  }
  
  ## Translate key to value
  positions <- match(x, keyvalue$key)
  res <- keyvalue[positions, "value", drop = TRUE]
  
  ## Apply extra functions if given
  if (!is.null(extra_functions)) {
    for (fun in extra_functions) {
      FUN <- get0(fun, mode = "function")
      if (is.null(FUN)) FUN <- match.fun(fun)
      res <- FUN(res)
    }
  }
  
  # Inform if some values could not be translated
  # Return these values if no more than five
  failed <- original_x[is.na(res) & !is.na(x)]
  if (length(failed) > 0 ) {
    msg <- paste("Some codes could not be translated")
    msg2 <- 
      if (length(failed) <= 5) 
        paste(failed, collapse = ", ") 
      else 
        paste(length(failed), "cells")
    msg <- paste0(msg, " (", msg2, ")")
    warning(msg, call. = FALSE)
  }
  
  res
}
