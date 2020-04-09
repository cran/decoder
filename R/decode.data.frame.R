#' @export
#' @rdname decode
decode.data.frame <- function(x, ...){
  
  nms <- names(x)
  
  # If x has variables named "_Beskrivning/_Värde" and no 
  # "_beskrivning/_värde", 
  # "_Beskrivning" is used otherwise "_beskrivning
  any_name <- function(x) any(endsWith(x, nms))
  beskrivning <- if (
      (any_name("_Beskrivning")  || any_name("_V\u00E4rde")) && 
      (!any_name("_beskrivning") || !any_name("_v\u00E4rde"))
    ) "_Beskrivning" else "_beskrivning"
  
  # Create a table describing all variables to decode
  decode_table <- merge(
    data.frame(x.var = nms, key = tolower(nms), stringsAsFactors = FALSE),
    ALL_STANDARD_VAR_NAMES,
    by = "key"
  )
  
  # Return x unchanged if no variables to decode:
  if (nrow(decode_table) == 0) {
    message("No variables decoded!")
    return(x)
  }
  
  # Otherwise, make names for new columns
  decode_table$new_name <- 
    paste0(decode_table$x.var, "_", decode_table$value, beskrivning)
  
  # Do not override existing _beskivnings-variables!
  already_beskrivning <- 
    intersect(tolower(decode_table$new_name), tolower(nms))
  if (!identical(already_beskrivning, character(0))) {
    message("Variable(s) ", paste(already_beskrivning, collapse = ", "),
            " seems to be already decoded and therefore left unchanged.")
    decode_table <- 
      decode_table[!(tolower(decode_table$new_name) %in% already_beskrivning), ]
  }
  
  # Decode each column
  for (i in seq_len(nrow(decode_table))) {
    d <- decode_table[i, , drop = FALSE]
    tryCatch(
      x[[d$new_name]] <- decode(x[[d$x.var]], d$value),
      warning = function(msg) {
        warning(d$x.var, " -> ", d$new_name, ": ", 
                sub("simpleWarning: ", "", msg), call. = FALSE)
      },
      finally = 
        suppressWarnings(x[[d$new_name]] <- decode(x[[d$x.var]], d$value))
    )
  }
  
  # Inform about new columns
  if (!identical(decode_table$new_name, character(0))) {
    message("New decoded columns added: \n* ", 
            paste(decode_table$new_name, collapse = "\n* ") )
  } 
  
  x
}
