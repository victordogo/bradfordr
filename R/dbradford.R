#' dbradford
#'
#' This function returns the distribution of the Standardized Bradford Distribution.
#'
#'
#' @param x vector of quantiles. Must be between 0 and 1.
#' @param c parameter of the standardized bradford distribution. Must be
#' greater than 0.
#' @param log logical; if TRUE, probabilities p are given as log(p)
#'
#' @return a vector of `length(x)` with distribution probabilities.
#' @export
#'
#' @examples dbradford(x=0.375, c=100)
#'
dbradford = function(x, c=5, log=FALSE){
  if(c <= 0){
    # Prints error
    stop("c parameter must be greater than 0.")
  } else if (any(!dplyr::between(x,0,1))) {
    # Also prints error
    stop("x must be between 0 and 1.")
  } else{

  d = c/(log(1+c)*(1+c*x)) # Calculating density

  d[which(d>1)] <- 1 # Temporary fix, d must be smaller than 1

  if(log==FALSE){
    return(d)
  } else {
    return(log(d))
  }
 }
}
