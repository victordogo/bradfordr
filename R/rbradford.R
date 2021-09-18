#' rbradford
#'
#' This function generates a vector of values from the Standardized Bradford
#' Distribution with length `n` and parameter `c`.
#'
#' @param n number of observations. If `length(n)>1`, the length is taken to be
#' the number required.
#'
#' @param c parameter of the standardized bradford distribution. Must be
#' greater than 0.
#'
#' @return a vector of length `n` with values generated from the Standardized
#' Bradford Distribution with parameter `c`.
#' @export
#'
#' @examples rbradford(n=100, c=10)
#'
rbradford = function (n, c=5){
  if(c <=0){
    stop("Error: c parameter must be greater than 0.")
    # this happens because of the own definition of the distribution
  } else {

  numbers = numeric(n) # creates vector of zeroes of length n

  for (i in 1:n){
    u <-  stats::runif (1) # gen random uniform number from 0 to 1
    numbers[i] <- (((1+c)^u)-1)/c # gen random bradford no. using
    # inverse sampling method
  }

  return(numbers)

  }
}

