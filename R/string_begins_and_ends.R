#' strBeginsWith
#' 
#' String x begins with y
#' 
#' @param x A big string should begins with y
#' @param y A small string
#' @return If x begins with y, then TRUE; else then FALSE
#' @export
#' @examples
#' strBeginsWith("hello","he")
#' ## [1] TRUE
#' strBeginsWith("hello","lo")
#' ## [1] FALSE
strBeginsWith = function(x, y) {
	NullCheck::stopNull()
    if (is.na(y)) { stop("Error: Y is NA!") }
    hl = nchar(x)
    nl = nchar(y)
    if (nl == 0) { warning("Y is empty!") }
    if (nl > hl) {
        return(F)
    } else {
        return(substr(x, 1, nl) == y)
    }
}

#' strEndsWith
#' 
#' String x ends with y
#' 
#' @param x A big string should ends with y
#' @param y A small string
#' @return If x ends with y, then TRUE; else then FALSE
#' @export
#' @examples
#' strEndsWith("hello","lo")
#' ## [1] TRUE
#' strEndsWith("hello","he")
#' ## [1] FALSE

strEndsWith = function(x, y) {
	NullCheck::stopNull()
    if (is.na(y)) { stop("Error: Y is NA!") }
    hl = nchar(x)
    nl = nchar(y)
    if (nl == 0) { warning("Y is empty!" )}
    if (nl > hl) {
        return(F)
    } else {
        return(substr(x, hl - nl + 1, hl) == y)
    }
}

