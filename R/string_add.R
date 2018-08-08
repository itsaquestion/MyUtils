#' conjoint two strings
#' @usage x \%+\% y
#' @return paste0(x,y)
#' @export
#' @examples
#' "hello" %+% " world!"
#' ## [1] "hello world!"
`%+%` <- function (x, ...) {
  UseMethod("%+%", x)
}

#' @export
`%+%.character` <- function (a, b) {
  paste0(a,b)
}

#' @export
`%+%.default` <- function (a, b) {
  paste0(as.character(a),as.character(b))
}

