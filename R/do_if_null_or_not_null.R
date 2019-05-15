#' ifnotnull
#' 
#' do someting if x is not null
#' 
#' @param x A object to check
#' @param not.null.cmd A clojure{} to eval when x is not null
#' @param null.cmd A clojure{} to eval when x is null; can be miss.
#' @export
ifnotnull = function(x, not.null.cmd, null.cmd) {
    if (!is.null(x)) {
        eval(not.null.cmd)
    } else {
        if (!missing(null.cmd)) {
            eval(null.cmd)
        }
    }
}

#' ifnull
#' 
#' do someting if x is null
#' 
#' @param x A object to check
#' @param cmd A clojure{} to eval when x is null
#' @export
ifnull = function(x, cmd) {
    if (is.null(x)) {
        eval(cmd)
    }
}

