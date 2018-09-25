

#' "Elvis" operator.
#'
#' @param x 
#' @param y 
#'
#' @return
#' @export
#'
#' @examples
`%||%` = function(x, y ){
  if(is.null(x)) y else x
}



