#' install_source
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples
install_source = function(x) {
  install.packages(x, repos = NULL, type = "source")
}