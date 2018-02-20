#' @export
rowApply = function(x, fun){
  tmp.list = NULL
  for(i in 1:nrow(x)){
    ret = fun(x[i,])
    tmp.list = rbind(tmp.list, ret)
  }
  tmp.list
}