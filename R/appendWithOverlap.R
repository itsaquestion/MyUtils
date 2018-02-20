
#' appendWithOverlap
#'
#' @param x 
#' @param ... 
#'
#' @return
#' @export
#'
#' @examples
appendWithOverlap = function(x, ...){
  UseMethod("appendWithOverlap", x)
}

#' appendWithOverlap.xts
#'
#' @param x 
#' @param y 
#'
#' @return
#' @export
#'
#' @examples
appendWithOverlap.xts = function(x, y){
  y.first = first(index(y))
  ii = which(index(x) == y.first)
  if(length(ii) > 0){
    ret = rbind(x[1:(ii-1)] ,y)
  }else{
    ret = rbind(x ,y)
  }
  ret
}





