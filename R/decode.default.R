

#' @export
#' @rdname decoder
decode.default <- function(x, keyvalue, extra_functions = NULL, exact = FALSE, ...){
    
    # Name used in warnings but can be very long
    name_x <- deparse(substitute(x)) 
    if (length(name_x) > 1 || nchar(name_x) > 30) name_x <- "x"
    original_x <- x
        
    if (!is.atomic(x)) {
        stop("decode only works for atomic vectors or data.frames!")
    } else if (all(is.na(x))) {
        return(x)
    }
    
    if (is.character(keyvalue)) {
        name_keyvalue <- keyvalue
        keyvalue <- get(keyvalue)
    } else{
        name_keyvalue <- deparse(substitute(keyvalue))
    }
    
    if (!is.keyvalue(keyvalue)) {
        keyvalue <- tryCatch(as.keyvalue(keyvalue), 
                             error = function(x) 
                                 stop("'keyvalue' is neither a keyvalue object, ",
                                        "nor an object that can be easily coerced ", 
                                        "to such! See '?as.keyvalue'"))
    }
      
   if (!exact) {
        transformed <- format_as_key(x, keyvalue, name_x, name_keyvalue)
        x <- transformed$x
        keyvalue <- transformed$keyvalue
    }
        
    ## Translate key to value
    positions <- match(x, keyvalue$key)
    res <- keyvalue[positions, "value", drop = TRUE]
     
    ## Apply extra functions if given
    if (!is.null(extra_functions)) {
        for (fun in extra_functions) {
            FUN <- match.fun(fun)
            res <- FUN(res)
        }
    }
    
    # Inform if some values could not be translated
    # Return these values if no more than five
    failed <- original_x[is.na(res) & !is.na(x)]
    if (length(failed) > 0 ) {
        msg <- paste0("Some codes could not be translated using \"", name_keyvalue, "\" as keyvalue object")
        msg2 <- if (length(failed) %in% 1:5) paste(failed, collapse = ", ") else paste(length(failed), "cells")
        msg <- paste0(msg, " (", msg2, ")")
        warning(msg, call. = FALSE)
    }
    
    res
}
