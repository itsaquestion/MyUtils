#' @export
print.xts = function(x, max.lines = 10, show.all = F,...){
	if (nrow(x) > (max.lines + 2) & !show.all) {
    hh = head(x, max.lines/2) %>% as.data.frame()
    tt = tail(x, max.lines/2) %>% as.data.frame()
    #colnames(tt) = NULL
    print(hh)
    cat("  ... ...\n")
    print(tt)
    cat("  Lines = ",length(x),"\n")
  }else{
    print(as.data.frame(x))
  }
  
} 