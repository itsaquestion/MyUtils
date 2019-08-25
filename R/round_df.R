#' round_df
#'
#' @return
#' @export
#'
#' @examples
round_df <- function(df, digits = 2) {
	#NullCheck::stopNull()
  mutate_if(df, is.numeric, round, digits=digits)
}

#' round.data.frame 
#'
#' @return
#' @export
#'
#' @examples
round.data.frame = round_df
