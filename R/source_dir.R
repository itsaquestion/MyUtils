#' sourceDir
#' 
#' source all .R files in a directory
#'
#' @param path path to the source directory 
#' @param recursive 
#' @param ... 
#' @param trace print the path if True 
#'
#' @export
sourceDir <- function(path, trace = TRUE, recursive = T, ...) {
	NullCheck::stopNull()
  for (nm in list.files(path, pattern = "\\.[RrSsQq]$",recursive = recursive)) {
    if(trace) cat(nm)           
    source(file.path(path, nm), ...)
    if(trace) cat("\n")
  }
}

