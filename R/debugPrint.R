#.debug_mode = F
#' @export
debugPrint = function(...) {
	if (.debug_mode) {
		cat("DEBUG >", ..., "\n")
	}
}

#' @export
debugPrintFun = function() {
	# print the caller of this function()
	debugPrint(getCaller(4))
}

#' @export
getCaller = function(level = 1) {
	deparse(sys.calls()[[sys.nframe() - level]])
}
