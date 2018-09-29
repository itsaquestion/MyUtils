#' Title
#'
#' @param x
#' @param path
#'
#' @return
#' @export
#'
#' @examples
saveData = function(x, path = "data_output") {
	if (!dir.exists(path)) { dir.create(path) }
	saveRDS(x, glue::glue("{path}/{name}.RDS", name = deparse(substitute(x))))
}

#' Title
#'
#' @param x
#' @param path
#' @param env
#'
#' @return
#' @export
#'
#' @examples
loadData = function(x, path = "data_output", env = parent.frame(n = 1)) {
	name = deparse(substitute(x))
	ret = readRDS(glue::glue("{path}/{name}.RDS"))
	assign(name, ret, envir = env)
	invisible(ret)
}
