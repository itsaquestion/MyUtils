#' getPageWithProxy
#'
#' @param url 
#' @param proxy 
#' @import RCurl
#' @return
#' @export
#'
#' @examples
getPageWithProxy = function(url,proxy = "socks5h://127.0.0.1:1081"){
  options(RCurlOptions = list(proxy = proxy))
  my.handle = getCurlHandle()
  getURL(url, curl=my.handle,.opts = list(ssl.verifypeer = FALSE))
}