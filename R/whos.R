#' Whos: show objects' info in current env
#'
#' @param no_functions 
#'
#' @return object names
#' @export 
#' @import dplyr
#' @import knirt
#' @examples
#' whos()
whos <- function(no_functions = T) {
  envir <- parent.frame()
  lslist <- ls(envir)
  if (length(lslist) == 0)
    return(invisible(NULL))

  m <- max(nchar(lslist))
  result = data.frame(object = character(), class = character(), type = character(), size = character())
  for (item in lslist) {
    itemObj <- eval(parse(text = item), parent.frame())
    itemClass <- class(itemObj)
    itemSize_raw <- object.size(itemObj)
    itemDim <- paste(dim(itemObj), collapse = "x")
    if (itemDim == '') itemDim <- length(itemObj)

    itemType = typeof(itemObj)

    itemSize <- as.numeric(itemSize_raw)
    if (itemSize < 1024) itemSize <- paste(itemSize, "By")
    else if (itemSize >= 1024 & itemSize < 1024 * 1024)
      itemSize <- paste(round(itemSize / 1024, 1), "KB")
    else
      itemSize <- paste(round(itemSize / 1024 / 1024, 1), "MB")

    result = rbind(result,
    data.frame(object = item, class = itemClass, type = itemType, size = itemSize, stringsAsFactors = F))

  }

  result = result %>% dplyr::arrange(object)

  if (no_functions) {
    result = dplyr::filter(result, result$class != "function")
  }

  print(knitr::kable(result, align = "lllr"))

  invisible(lslist)
}