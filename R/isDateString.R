#' isDateString
#
#' Check if a string a Date format string.
#' 
#' @param x A string should be a date like "2017-01-01".
#' @return If x is a date stirng, True; else False.
#' @examples
#' isDateString("2017-01-01")
#' ## [1] True
#' isDateString("20170101")
#' ## [1] FALSE 
#' @export
isDateString = function(x) {
	#NullCheck::stopNull()
  pattern1 = '\\b\\d{4}-(0[1-9]|1[0-2])-(0[1-9]|2[0-9]|3[0-1])$'
  tdBool = grepl(pattern1, x)
  return(tdBool)
}
