

#' @export
minusIsBigger = function(x) {
	NullCheck::stopNull()
  if(any(x < 0,na.rm = T)){
    x[x <= 0 & !is.nan(x)] = x[x <= 0 & !is.nan(x)] * (-1) + max(x,na.rm = T)
  }
  x
}

#' @export
rankWithNa = function(x) {
	NullCheck::stopNull()
  res  = rank(x)
  res[is.na(x)] = NA
  res
}
