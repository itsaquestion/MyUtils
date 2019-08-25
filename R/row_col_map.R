

#' @export
colMap = function(x, ...) {
  UseMethod("colMap", x)
}

#' @export
colMap.default = function(x, .f, ...) {
  #  tmp = vector("list", length = ncol(x))
  #  for (i in 1:ncol(x)) {
  #    tmp[[i]] = .f(x[, i])
	#  }
	#NullCheck::stopNull()
  ret = Reduce(cbind, lapply(x, .f, ...))
  colnames(ret) = colnames(x)
  ret
}

#' @export
colMap.data.frame = function(x, .f, ...) {
  data.frame(colMap.default(x, .f, ...))
}
