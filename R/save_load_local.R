#' qSave
#'
#' @param x
#' @param path
#'
#' @return
#' @export
#'
#' @examples
qSave = function(x, path = "data_output") {
	object_name = deparse(substitute(x))
	if (!exists(object_name)) { stop(glue::glue("object \"{object_name}\" not exists.")) }
	if (!dir.exists(path)) { dir.create(path) }
	saveRDS(x, glue::glue("{path}/{name}.RDS", name = deparse(substitute(x))))
}

#' qLoad
#'
#' @param x
#' @param path
#' @param env
#'
#' @return
#' @export
#'
#' @examples
qLoad = function(x, path = "data_output", env = parent.frame(n = 1)) {
	name = deparse(substitute(x))
	ret = readRDS(glue::glue("{path}/{name}.RDS"))
	assign(name, ret, envir = env)
	invisible(ret)
}


#' @export
sSave = function(x, name, path = "data_output") {
	if (!dir.exists(path)) { dir.create(path) }
	saveRDS(x, glue::glue("{path}/{name}.RDS", name = name))
}

#' @export
sLoad = function(name, path = "data_output") {
	ret = readRDS(glue::glue("{path}/{name}.RDS"))
	ret
}