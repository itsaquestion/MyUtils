# 求两者的比分比差 x 100
#' @export
percentDiff = function(a, b, digit = 2) {
	NullCheck::stopNull()
  round(((a / b) - 1) * 100, digit)
}