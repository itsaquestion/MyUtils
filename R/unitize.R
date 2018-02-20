#' @export
unitize = function(x){
  UseMethod("unitize",x)
}
#' @export
unitize.xts = function(x){
  first.line = as.numeric(x[1,])
  rowApply(x,function(x){x / first.line})
}

