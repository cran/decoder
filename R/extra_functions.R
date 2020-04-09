#'Extra functions to apply to decoded variables using decode
#'
#'See section "extra_functions" at the \link{decode} help page!
#'
#' @param x The decoded variable to be further processed. 
#' This argument should not be set by the user.
#' It is used only internally by the function from which it is called.
#' @name extra_functions
#' @export
kungalv2Storgoteborg <- function(x){
    x <- as.character(x)
    x[x == "Kungalv"] <- "Storgoteborg"
    x
}

#' @rdname extra_functions
#' @export
kungalv2Fyrbodal <- function(x){
    x <- as.character(x)
    x[x == "Kungalv"] <- "Fyrbodal"
    x
}

#' @rdname extra_functions
#' @export
real_names <- function(x){
    x <- as.character(x)
    x[x == "Kungalv"]        <- "Kung\u00E4lv"
    x[x == "Norra_Halland"]  <- "Norra Halland"
    x[x == "Sodra_Alvsborg"] <- "S\u00F6dra \u00C4lvsborg"
    x[x == "Storgoteborg"]   <- "Storg\u00F6teborg"
    x
}

#' @rdname extra_functions
#' @export
short_region_names <- function(x){
    gsub("Region ", "", as.character(x))
}
