# Try to transform x in order to fit the key from keyvalue
format_as_key <- function(x, keyvalue){
  
  x <- as.character(x)
  keyvalue <- as.keyvalue(keyvalue)
  
  # initiate warning message
  msg <- ""
  
  has     <- function(x, pattern) any(grepl(pattern, x), na.rm = TRUE)
  start_0 <- function(y) any(startsWith(y, "0"), na.rm = TRUE) 
  
  # Trim spaces 
  if (has(x, "[[:blank:]]")) {
    x <- trimws(x)
    msg <- "Spaces are removed from beginning and end."
  }
  
  # If x starts with zero but the key does not, zeroes are removed
  # This applies even if x is still character 
  # (and is therefore not an ifelse statement)
  if (start_0(x) & !start_0(keyvalue$key)) {
    msg <- paste(msg, "Leading 0:s are ignored.")
  }
  while (start_0(x) & !start_0(keyvalue$key)) {
    x <- 
      ifelse(
        startsWith(x, "0"), # If leading 0 ...
        substring(x, 2),    # ... remove the 0 ...
        x)                  # ... otherwise leave unchanged
  }
  
  # If key starts with 0 but x does not, pad with zeros!
  # Only applies if all codes have the same length and x is shorter than 
  # this length
  key_length <- nchar(keyvalue$key)[1]
  if (!start_0(x) && 
      start_0(keyvalue$key) && 
      Reduce(`==`, stats::na.omit(nchar(keyvalue$key))) &&
      key_length > min(nchar(x), na.rm = TRUE)) {
    x <- pad0(x, key_length)
    msg <- paste(msg, "Leading 0:s are introduced for short characters.")
  }
  
  # If x has punctuations but the key has not, punctuations are removed from x
  if (has(x,             "[[:punct:]]") && 
      !has(keyvalue$key, "[[:punct:]]")) {
    x <- gsub("[[:punct:]]", "", x)
    msg <- paste(msg, "Punctuations are removed.")
  }
  
  # If key has no capitals, all letters in x are made lowercase
  if (has(x,             "[[:upper:]]") && 
      has(keyvalue$key,  "[[:lower:]]") && 
      !has(keyvalue$key, "[[:upper:]]")) {
    x <- tolower(x)
    msg <- paste(msg, "Capitals are changed to lower case.")
    
    # If key has no lowercase, all letters in x are made upper case
  } else if (
    has(x,                "[[:lower:]]") && 
    has(keyvalue$key,     "[[:upper:]]") && 
    !has(keyvalue$key,    "[[:lower:]]")) {
    x <- toupper(x)
    msg <- paste(msg, "Lower case are changed to upper case.")
  }
  
  # If the key is shorter than x, x is substringed
  key_length <- max(nchar(keyvalue$key), na.rm = TRUE)
  if (max(nchar(x), na.rm = TRUE) > key_length) {
    x <- substr(x, 1, key_length)
    msg <- paste(msg, "Only the first", key_length, "characters are used.")
  }
  
  ## Print warning if any changes made
  if (msg != "")
    warning("transformed to match the keyvalue: ", msg, call. = FALSE)
  
  list(x = x, keyvalue = keyvalue)
}
