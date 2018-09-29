

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
#' @import rredis
#' @import purrr
saveToRedis = function(x, key = NULL, host = NULL, port = 6379, password = NULL) {
	key = key %||% deparse(substitute(x))
	connectRedis(host, port, password)
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
#' @import rredis
loadFromRedis = function(key, host = NULL, port = 6379, password = NULL) {
	#key = deparse(substitute(x))
	connectRedis(host, port, password)
	ret = redisGet(key)
	redisClose()
	ret
}


#' @export
#' @import rredis
#' @import purrr
connectRedis = function(host = NULL, port = 6379,  password = NULL) {

	redis_host = host %||% getEnv("Redis_host") %||% "localhost"

	redis_passwd = password %||% getEnv("Redis_password")

	redisConnect(host = redis_host, port = port, password = redis_passwd)
}

#' @export
getEnv = function(x) {
	ret = Sys.getenv(x)
	if (ret == "") {
		ret = NULL
	}
	ret
}

