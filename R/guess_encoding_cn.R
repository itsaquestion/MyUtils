#' guess_encoding_cn
#' 猜测中文文件的编码，并且返回概率最大的一个。
#' @param x 文件路径
#'
#' @return 编码
#' @export 
#'
#' @examples
guess_encoding_cn = function(x) {
	NullCheck::stopNull()
	guess = readr::guess_encoding(x)
	guess = filter(guess, startsWith(guess$encoding, "GB") | guess$encoding == "UTF-8")
	guess$encoding[1]
}

