#' pbradford
#'
#' This function returns probabilities from the accumulated distribution function
#' of the Bradford Distribution.
#'
#' @param x vector of quantiles. Must be between 0 and 1.
#' @param c parameter of the standardized bradford distribution. Must be
#' greater than 0.
#' @param lower.tail logical; if TRUE (default), probabilities are given as
#' P(x<=X); otherwise, P(x > X).
#' @param log.p  logical; if TRUE, probabilities p are given as log(p)
#'
#' @return a vector of `length(x)` with accumulated distribution probabilities.
#' @export
#'
#' @examples pbradford(x=0.5, c=10)
#'
pbradford = function(x, c=5, lower.tail=TRUE, log.p=FALSE){
  if(c<=0){
    # Prints error
    print("Error: c parameter must be greater than 0.")
  } else if ((x<0) || (x>1)){
    # Also prints error
      print("Error: x must be between 0 and 1.")
  } else {
    # Calculates probability accordingly

    p <-  log(1+c*x)/log(1+c)

    if(lower.tail==TRUE){
      if(log.p==TRUE){
        return(log(p))
      } else {
        return(p)
      }
    } else {
      if(log.p==TRUE){
        return(log(1-p))
      } else{
        return(1-p)
      }
    }
  }
}
