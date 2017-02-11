#' Object summary for keyvalue objects
#'
#' Objects of type \code{keyvalue11} are summarised as data.frames with an additional display of possible
#' \code{standard_var_names}. Objects of type \code{keyvalue} also gives a list of non 1:1 key-value pairs.
#' @param object a keyvalue object
#' @param ... ignored
#' @return A list with three elements: a summmary of the underlying data.frame,
#' the standard_var_names and possibly a data.frame with all non 1:1 relations.
#' @export
#' @seealso \link{keyvalue}
summary.keyvalue <- function(object, ...){
  data.frame.summary <- summary.data.frame(object)
  
  standard_var_names <- attr(object, "standard_var_names")
  
  if (!is.keyvalue11(object)) {
    nonunique <- 
      object[object$value %in% 
               unlist(dimnames(table(object$value)[table(object$value) > 1])), ]
    nonunique <- nonunique[order(nonunique$value),]
  }
  
  list(
    data.frame.summary = data.frame.summary,
    standard_var_names = standard_var_names,
    nonunique          = nonunique
  )
}
