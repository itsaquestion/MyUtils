#' @export
unitize = function(x, ...) {
  UseMethod("unitize", x)
}

#' @export
unitize.xts = function(x, target.date = NULL) {
  ret = NULL
  if (!is.null(target.date)) {
    line = x[target.date %+% "::"] %>% first()

    ret = rowApply(x, function(x) {
      #x = last(metal.price)
      x / as.vector(line)
    })

  } else {
    ii = data.frame(x) %>% complete.cases
    first.ii = which(ii & !lag(ii))[1]
    first.line = as.numeric(x[first.ii,])
    ret = rowApply(x, function(x) { x / first.line })
  }

  ret
}