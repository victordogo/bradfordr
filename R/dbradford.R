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
dbradford = function(x, c=5, log=FALSE){
  if(c <= 0){
    # Prints error
    stop("c parameter must be greater than 0.")
  } else if (x<0 || x>1) {
    # Also prints error
    stop("x must be between 0 and 1.")
  } else{

  d = c/(log(1+c)*(1+c*x)) # Calculating density

  if(d>1){d <- 1} # This is probably a temporary fix, d cant be bigger than 1

  if(log==FALSE){
    return(d)
  } else {
    return(log(d))
  }
 }
}
