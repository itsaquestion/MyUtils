

#' @export
colMap = function(x, ...) {
  UseMethod("colMap", x)
}

#' @export
colMap.default = function(x, .f, ...) {
  tmp = vector("list", length = ncol(x))
  for (i in 1:ncol(x)) {
    tmp[[i]] = .f(x[, i])
  }
  ret = Reduce(cbind, tmp)
  colnames(ret) = colnames(x)
  ret
}

#' @export
colMap.data.frame = function(x, .f, ...) {
  ret = data.frame(colMap.default(x, .f, ...))
  ret
}

#' @export
rowMap = function(x, ...) {
  UseMethod("rowMap", x)
}

#' @export
rowMap.default = function(x, .f, col_names = NULL, ...) {
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
  as.xts(ret, order.by = index(x))
}

#' @export
rowMap.data.frame = function(x, .f, ...) {
  ret = rowMap.default(x, .f, ...)
  rownames(ret) = NULL
  #print(ret)
  as.data.frame(ret, row.names = NULL)
}
