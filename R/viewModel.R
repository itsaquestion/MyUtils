#' viewModel 
#'
#' @return
#' @export
#' @import stargazer
#'
#' @examples
viewModel = function(...) {
  stargazer::stargazer(..., type = "text", omit.stat = c("f", "ser"))
}