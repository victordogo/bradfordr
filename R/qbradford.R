#' qbradford
#'
#' This function gives the quantile function from the Standardized
#' Bradford Distribution.
#'
#' @param p vector of probabilities.
#' @param c parameter of the standardized bradford distribution. Must be
#' greater than 0.
#' @param lower.tail logical; if TRUE (default), probabilities are given as
#' P(x<=X); otherwise, P(x > X).
#' @param log.p  logical; if TRUE, probabilities p are given as log(p)
#'
#' @return a vector of `length(p)` with the distribution quantiles.
#'
#' @export
#'
#' @examples qbradford(p=0.5, c=13)
#'
qbradford <- function(p, c=5, lower.tail=TRUE, log.p=FALSE){
  if(c<=0){
    # Prints error
    stop("c parameter must be greater than 0.")
  } else if (any(!dplyr::between(p,0,1))){
    # Also prints error
    stop("p is a probability and must be between 0 and 1.")
  } else {
    q <- ((1+c)^(p) - 1)/c

    if(lower.tail==TRUE){
      if(log.p==TRUE){
        return(log(q))
      } else {
        return(q)
      }
    } else {
      if(log.p==TRUE){
        return(log(1-q))
      } else{
        return(1-q)
      }
    }
 }
}
