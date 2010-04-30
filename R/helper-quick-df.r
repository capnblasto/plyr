#' Quick data frame.
#' Experimental version of \code{\link{as.data.frame}} that converts a 
#' list to a data frame, but doesn't do any checks to make sure it's a
#' valid format.  Much faster.
#'
#' @param list list to convert to data frame
#' @keywords internal
quickdf <- function(list) {
  structure(list, 
    class = "data.frame",
    row.names = seq_along(list[[1]]))
}