

#' saveToRedis
#'
#' @param x
#' @param key
#' @param host
#' @param password
#'
#' @return
#' @export
#'
#' @examples
saveToRedis = function(x, key = NULL, host = NULL, password = NULL) {
	key = key %||% deparse(substitute(x))
	connectRedis(host,password)
	redisSet(key, x)
	redisClose()
}

#' Title
#'
#' @param key
#' @param host
#' @param password
#'
#' @return
#' @export
#'
#' @examples
loadFromRedis = function(key, host = NULL, password = NULL) {
	#key = deparse(substitute(x))
	connectRedis(host,password)
	ret = redisGet(key)
	redisClose()
	ret
}



connectRedis = function(host = NULL, password = NULL) {

	redis_host = host %||% Sys.getenv("Redis_host") %||% stop("Unknow Redis host!")

	redis_passwd = password %||% Sys.getenv("Redis_password") %||% stop("Unknow Redis password!")

	redisConnect(host = redis_host, password = redis_passwd)
}

