#' rmAll (skipping WindR functions) 
#'
#' @return
#' @export
#'
#' @examples
#' rmAll()
rmAll = function(){
  env <- parent.frame()
  object.list <- objects(env)
  wfun = c( "w.global.Functions", "w.global.TradeFunc")
  object.list = object.list[!(object.list %in% wfun)]
  
  rm(list = object.list, envir = env)
  
  return(invisible(1))

}