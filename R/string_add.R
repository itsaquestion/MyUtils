#' conjoint two strings
#' @usage x \%+\% y
#' @return paste0(x,y)
convertAndPaste = function(a, b) {
	NullCheck::stopNull()
	paste0(as.character(a), as.character(b))
}

#' @export
#' @examples
#' "hello" %+% " world!"
#' ## [1] "hello world!"
`%+%` <- function (x, ...) {
  UseMethod("%+%", x)
}

#' @export
`%+%.character` <- convertAndPaste

#' @export
`%+%.Date` <- convertAndPaste

#' @export
`%+%.POSIXct` <- convertAndPaste

