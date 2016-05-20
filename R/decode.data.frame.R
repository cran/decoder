#' @export
#' @rdname decoder

decode.data.frame <- function(x, ...){
    
    if (!missing(...)) {
        warning("Additional arguments to decode.data.frame ignored!")
    }
   
    nms <- names(x)
    
    # If x has variables named "_Beskrivning/_Värde" and no "_beskrivning/_värde", "_Beskrivning" is used
    # otherwise "_beskrivning
    beskrivning <- 
        if (
            (any(grepl("_Beskrivning", nms)) || any(grepl("_V\u00E4rde", nms))) && 
            (!any(grepl("_beskrivning", nms)) || !any(grepl("_v\u00E4rde", nms)))
            ) {
            "_Beskrivning"
        } else {
            "_beskrivning"
        }
    
    # Create a table describing all variables to decode
    decode_table <- 
        merge(
            data.frame(
                x.var = nms,
                key = tolower(nms),
                stringsAsFactors = FALSE
            ),
            ALL_STANDARD_VAR_NAMES,
            by = "key"
        )
    
    # Return x unchanged if no variables to decode:
    if (nrow(decode_table) == 0) {
        message("No variables decoded!")
        return(x)
    }
    
    # Otherwise, make names for new columns
    decode_table$new_name <- paste0(decode_table$x.var, "_", decode_table$value, beskrivning)
        
    # Do not override existing _beskivnings-variables!
    already_beskrivning <-  intersect(decode_table$new_name, tolower(nms))
    if (!identical(already_beskrivning, character(0))) {
        message("\n\nVariable(s) ", paste(already_beskrivning, collapse = ", "),
                " seems to be already decoded and therefore left unchanged.")
        decode_table <- decode_table[!(decode_table$new_name %in% already_beskrivning), ]
    }
    
    # Decode each column
    for (i in seq_len(nrow(decode_table))) {
        d <- decode_table[i, , drop = FALSE]
        tryCatch(x[[d$new_name]] <- decode(x[[d$x.var]], d$value),
                 warning = function(msg){
                     warning(paste("column", 
                                   d$x.var, substring(msg, 29)), call. = FALSE)
                 },
                 finally = suppressWarnings(x[[d$new_name]] <- decode(x[[d$x.var]], d$value))
        )
    }
    
    # Inform about new columns
    if (!identical(decode_table$new_name, character(0))) {
        message("\nNew decoded columns added: \n* ", 
                paste(decode_table$new_name, collapse = "\n* ") )
    } 
    
    x
}
