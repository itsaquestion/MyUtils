

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
	NullCheck::stopNull()
  ret = Reduce(cbind, lapply(x, .f, ...))
  colnames(ret) = colnames(x)
  ret
}

#' @export
colMap.data.frame = function(x, .f, ...) {
  data.frame(colMap.default(x, .f, ...))
}

#' @export
rowMap = function(x, ...) {
  UseMethod("rowMap", x)
}

#' @export
rowMap.default = function(x, .f, col_names = NULL, ...) {
	NullCheck::stopNull(except ="col_names")
  tmp = vector("list", length = nrow(x))
  for (i in 1:nrow(x)) {
    tmp[[i]] = .f(x[i,])
  }
  ret = Reduce(rbind, tmp)
  if (!is.null(col_names)) { colnames(ret) = col_names }
  ret
}

#' @export
rowMap.xts = function(x, .f, ...) {
  ret = rowMap.default(x, .f, ...)
  if (!xts::is.xts(ret)) {
    ret = as.xts(ret, order.by = index(x))
  }
  #as.xts(ret, order.by = xts::index(x))
  ret
}

#' @export
rowMap.data.frame = function(x, .f, ...) {
  ret = rowMap.default(x, .f, ...)
  rownames(ret) = NULL
  #print(ret)
  as.data.frame(ret, row.names = NULL)
}
