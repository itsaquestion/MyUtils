#' @export
unitize = function(x, ...) {
  UseMethod("unitize", x)
}

#' @export
unitize.xts = function(x, target.date = NULL) {
	#NullCheck::stopNull(except = "target.date")
  ret = NULL
  if (!is.null(target.date)) {
    line = x[target.date %+% "::"] %>% first()

    ret = rowMap(x, function(x) {
      #x = last(metal.price)
      x / as.vector(line)
    })

  } else {
    ii = data.frame(x) %>% complete.cases
    #x = x[ii]
    first.ii = which(ii & !lag(ii))[1]
    if (is.na(first.ii)) { first.ii = 1 }
    first.line = as.numeric(x[first.ii,])
    ret = rowMap(x, function(x) { x / first.line })
  }

  ret
}
