#' doWithProxy
#' @param cmd r commands to be execute with proxy
#' @param proxy_url
#' @param port
#'
#' @return
#' @export 
#' @import NullCheck
#' @examples
#' doWithProxy(GET("http://www.google.com"))
doWithProxy = function(cmd, proxy_url = "127.0.0.1", port = 1080) {
	NullCheck::stopNull()
	httr::with_config(httr::use_proxy(proxy_url, port), cmd)
}
