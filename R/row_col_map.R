#' @export
rowMap = function(x,...){
  UseMethod("rowMap",x)
}

#' @export
rowMap.data.frame = function(x, f){
  result = list()
  for(i in 1:nrow(x)){
    result[[i]] = f(x[i,])
  }
  result = Reduce(rbind,result)
  rownames(result) = NULL
  result
}


#' @export
colMap = function(x,...){
  UseMethod("colMap",x)
}

#' @export
colMap.data.frame = function(x, f){
  result = list()
  for(i in 1:ncol(x)){
    result[[i]] = f(x[,i])
  }
  result = Reduce(cbind,result)
  colnames(result) = colnames(x)
  result
}