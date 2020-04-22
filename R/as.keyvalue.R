#' Coerce to a keyvalue object
#'
#' Functions to check if an object is a keyvalue object, or coerce it if
#' possible.
#'
#' \code{x} can be of: \itemize{ \item a name of a package internal (or
#' external) keyvalue object (character of length one) \item a \code{data.frame}
#' with two columns "key" (with unique cells) and "value". \item a list as
#' described in \code{\link{as.keyvalue.list}} \item a named vector with all
#' names unique \item an unnamed vector with unique cells if supplemented by
#' additional vector (y) }
#'
#' @name keyvalue
#' @param x object to test for, or coerce to, keyvalue (see the details).
#' @param y a value vector if \code{x} is an unnamed vector (argument must be
#'   named 'y = .')
#' @param standard_var_names a character vector with standard names for
#'   variables decoded with this key-values.
#' @param ... arguments passed between methods
#'
#' @return \code{as.keyvalue} returns a data.frame with additional class
#' \code{keyvalue} that fulfills the requirements for a \code{keyvalue} object
#' and with the \code{key} column as character. It also has two extra attributes
#' \code{standard_var_names} as described above and \code{keyvalue11} which is
#' \code{TRUE} for keyvalue objects with a 1:1 relation between its keys and
#' values (otherwise FALSE).
#'
#' @export
#' @seealso \link{as.keyvalue.list}, \link{decode}, \link{summary.keyvalue},
#'   \link{key_and_value}
#' @examples
#' snomed2 <- as.keyvalue(snomed)
#' is.keyvalue(snomed2)
#' summary(snomed2)
as.keyvalue <- function(x, ...){
    UseMethod("as.keyvalue")
}
