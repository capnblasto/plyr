#' Summarise a data frame.
#' Create a new data frame that summarises an existing data frame.
#' 
#' Summarise works in an analagous way to transform, except instead of adding
#' columns to an existing data frame, it creates a new one.  This is
#' particularly useful in conjunction with \code{\link{ddply}} as it makes it
#' easy to perform group-wise summaries.
#' 
#' @param .data the data frame to be summarised
#' @param ... further arguments of the form var = value
#' @keywords manip
#' @aliases summarise summarize
#' @examples
#' summarise(baseball, 
#'  duration = max(year) - min(year), 
#'  nteams = length(unique(team)))
#' ddply(baseball, "id", summarise, 
#'  duration = max(year) - min(year), 
#'  nteams = length(unique(team)))
summarise <- function(.data, ...) {
  as.data.frame(eval(substitute(list(...)), .data, parent.frame()))
}
summarize <- summarise

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