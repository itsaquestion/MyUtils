#' convertPOSIXct2Date
#' 
#' convert the index of xts object from POSIXct to Date
#' 
#' @param x A xts object
#' @return A converted xts object
#' @importFrom xts is.xts
#' @importFrom zoo index
convertPOSIXct2Date = function(x) {
	NullCheck::stopNull()
    if (!xts::is.xts(x)) {
        stop("convertPOSIXct2Date: param must be a xts object!")
    }
    zoo::index(x) = as.Date(as.character(zoo::index(x)), tz = "UTC")
    x
}
