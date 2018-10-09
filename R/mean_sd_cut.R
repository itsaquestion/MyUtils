
#' @export
mean_cut = function(x, cut_percent = 1) {
	
	x_fix = cleanX(x, cut_percent)

	mean(x_fix)
}

#' @export
sd_cut = function(x, cut_percent = 1) {

	x_fix = cleanX(x, cut_percent)

	sd(x_fix)

}

cleanX = function(x, cut_percent = 1) {
	x_fix = x[!is.na(x)]
	x_fix = x_fix[order(x_fix)]

	n = floor(length(x_fix)) * (cut_percent / 100)

	ret = x_fix[(n + 1):(length(x_fix) - n)]

	ret 
}