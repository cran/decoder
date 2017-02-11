#'Decode codes to plain text (and vice versa)
#'
#'Translate coded values into meaningful plain text (or reversed). 
#'
#'@param x object to decode. Either a key vector to be matched againt the 
#'  \code{key} column in \code{keyvalue}, or a data.frame (see section 
#'  \code{decode.data.frame}). object.
#'@param y value to be coded (to be matched againt the \code{value} element) in 
#'  a \link{keyvalue} object.
#'@param keyvalue either a name (as character string) of a package internal 
#'  \link{keyvalue} object, or a user 
#'  defined keyvalue object (see \link{as.keyvalue}).
#'@param exact Should \code{x} have an exact match from the key? Default is 
#'  \code{FALSE}. When \code{FALSE}, \code{x} might be transformed to fit the 
#'  key (punctuation might be removed, upper case changed to lower case or vice 
#'  versa and strings that are too long might be substringed). (\code{code} only
#'  accept excact matches.)
#'@param extra_functions is a list of functions (or names of functions as 
#'  character vector) to be applied to the decoded data after decoding (see 
#'  section "extra_functions" below).
#'@param verbose (only for \code{code}) can be set to \code{FALSE} to avoid a 
#'  printed message to the console if an error occur (\code{TRUE} as default).
#'@param ... ignored
#'  
#'@return \itemize{ \item For default S3 method: A vector of the same length as 
#'  \code{x} but with all cells decoded (or coded) to plain text (or code) as 
#'  character. \item For S3 method for class 'data.frame': Data.frame \code{x}
#'  is returned, possibly with some extra columns (names ending in
#'  '_Beskrivning'), decoded from columns with names corresponding to attribute 
#'  \code{standard_var_names} for keyvalue objects listed by 
#'  \code{list_keyvalues()}. }
#'  
#'@section Vignette: See the vignette for a longer introduction to the package:
#'  \code{vignette("decoder")}
#'  
#'@section decode.data.frame: If \code{x} is a data.frame, all column names of 
#'  \code{x} are matched to attribute \code{standard_var_names} for all keyvalue
#'  objects in the package (see \code{list_keyvalues()}). If the column name is 
#'  a standard name used for a coding, the corresponding keyvalue object is used
#'  to decode the column and to add an extra column to \code{x} with its 
#'  original name with suffix \code{_Beskrivning}. This is done for all 
#'  identified columns. 
#'  
#'@section extra_functions: The relationship betwen the key and the value in a 
#'  keyvalue object is either 1:1 or m:1. The mapping is straight forward for 
#'  1:1 but with m:1, different applications might require slightly different 
#'  groupings of the keys. One solution is to have several versions of the 
#'  \link{keyvalue} object. Another (which we prefer) is to use the same 
#'  \link{keyvalue} object (if possible) but to call one or several extra 
#'  function(s) to further process the result. These functions are either built 
#'  in package functions that should be called by quoted names or user defined 
#'  functions that can be called by either quoted or unquoted names (if 
#'  available in the current environment). Note that the order of the functions 
#'  could matter since they are called in turn (the output from the first 
#'  function is passed as input to the second function etc).
#'  
#'  Standard functions and how to use them:
#'  
#'  To use with \link{sjukvardsomrade}:
#'  
#'  \describe{ \item{\code{kungalv2Fyrbodal}}{The default classification used in
#'  \link{sjukvardsomrade} is to make Kungalv a region of its own. Use this 
#'  function if Kungalv should be included in Fyrbodal. See example section 
#'  below.} \item{\code{kungalv2Storgoteborg}}{As \code{kungalv2Fyrbodal} but 
#'  classifies Kungalv as a part of Storgoteborg.} \item{\code{real_names}}{Give
#'  the area names with correct Swedish spelling (including spaces). This is not
#'  as default due to compability reasons and because names with spaces must be 
#'  back-ticked when reffered to.} }
#'  
#'  To use with \link{region} \describe{ 
#'  \item{\code{short_region_names}}{Exclude the prefix 'Region' from the region
#'  names, hence 'Syd' instead of 'Region Syd' etcetera.} }
#'  
#'@seealso \link{keyvalue}, \link{extra_functions}
#' @examples
#'
#' KON_VALUE <- sample(1:2, 20, replace = TRUE)
#' (kon <- decode(KON_VALUE, "kon"))
#' code(kon, "kon")
#'
#' # Get a sample of Snomed-codes (in the real world we obviously avoid this step) ...
#' snomed2 <- sample(decoder:::snomed$key, 30, replace = TRUE)
#' # ... then decode them:
#' (snomed3 <- decode(snomed2, "snomed"))
#'
#'
#' # Health care regions can be defined in more than one way
#' # By default Kungalv define a region of its own:
#' set.seed(123456789)
#' healtcare_areas_west <- sample(unlist(decoder:::sjukvardsomrade), 100, replace = TRUE)
#' (areas <- decode(healtcare_areas_west, "sjukvardsomrade"))
#' table(areas)
#'
#' # But if we want Kungalv to be a part of Storgoteborg
#' # (which is common practice for example with lung cancer data):
#' (areas2 <- decode(healtcare_areas_west, "sjukvardsomrade", "kungalv2Storgoteborg"))
#' table(areas2)
#'
#' # We can also combine several extra_functions if we for example
#' # also want the area names with correct Swedish spelling.
#' (areas3 <- decode(healtcare_areas_west, "sjukvardsomrade", c("kungalv2Storgoteborg", "real_names")))
#'
#'
#' # The region names can be both with and without prefix:
#' regs <- sample(6, 10, replace = TRUE)
#' decode(regs, "region") # With prefix
#' decode(regs, "region", "short_region_names") # without prefix
#'
#' # Note that only the first four digits of the LKF-code were used abowe?
#' # What if we use the full LKF-code?
#' lkfs <- sample(decoder:::forsamling$key, 100, replace = TRUE)
#' decode(lkfs, "sjukvardsomrade")
#' # That work's just as fine when argument exact = FALSE (which it is by default).
#' 
#' # decode can also be used for data.frames with recognised column names
#' d <- data.frame(
#'      kon = sample(1:2, 10, replace = TRUE), 
#'      sex = sample(1:2, 10, replace = TRUE),
#'      lkf = sample(decoder:::hemort$key, 10, replace = TRUE)
#'  )
#'  decode(d)
#'
#' ### --- code --- ###
#' # Sometimes we have keyvalue objects with some key-value pairs without a 1:1 relation.
#' # This is true for snomed
#' # Show all non 1:1 pairs:
#' summary(decoder:::snomed)$nonunique
#' # Save them for later:
#' non_unique_snomeds <- summary(decoder:::snomed)$nonunique$key
#'
#' # Use these snomed codes for decoding and coding
#' # Decoding works fine (all keys are unique) ...
#' (a <- decode(non_unique_snomeds, "snomed"))
#' # ... but coding these values back to their key does not
#' \dontrun{
#' code(a, "snomed")
#' }
#'@author Erik Bulow
#'@name decode
#' @export
decode <- function(x, ...)  UseMethod("decode")
