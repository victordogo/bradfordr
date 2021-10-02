#' The Standardized Bradford Distribution
#'
#' @description
#' Density, distribution function, quantile function, and random generation for
#' the Standardized Bradford Distribuction with parameter equal to c, which must
#' be greater than 0. `dbradford` gives the density, `pbradford` gives the distribution function,
#' `qbradford` gives the quantile function and `rnorm` generates random numbers
#' from the distribution.
#'
#' @details
#' If c is not specified, it assumes the default value of 5.
#' The Standardized Bradford Distribution has density defined as
#' \deqn{f(x;c) = \frac{c}{log(1+c) log(1+ cx)}}
#' for \eqn{c > 0} and \eqn{0 \leq x \leq 1}.
#'
#'
#' @source
#' The main definition for for the Standardized Bradford Function was taken from
#' [SciPy](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.bradford.html).
#' The `rbradford` function is defined using the [Inverse Transform Sampling Method,](https://en.wikipedia.org/wiki/Inverse_transform_sampling)
#' with a more in depth explanation presented in the package's vignettes. All functions
#' were built to work like the probability functions in the[`{stats}`](https://www.rdocumentation.org/packages/stats/versions/3.6.2) package.
#'
#'
#' @param x,q A vector of quantiles. Must be between 0 and 1.
#' @param p A vector of probabilities.
#' @param c The parameter of the standardized bradford distribution. Must be
#' greater than 0.
#' @param n number of observations. If `length(n)>1`, the length is taken to be
#' the number required.
#' @param lower.tail logical; if TRUE (default), probabilities are given as
#' P(x<=X); otherwise, P(x > X).
#' @param log,log.p  logical; if TRUE, probabilities p are given as log(p)
#' @return A numeric vector.
#'
#' @examples
#' set.seed(1996)
#'
#' # Generate 10 random numbers with c=10
#' rbradford(n=10, c=10)
#'
#' # What value satisfies P(X <= x) = 0.5 when c=13?
#' qbradford(p=0.5, c=13)
#'
#' # Probability of P(X <=0.5) when c=10
#' pbradford(q=0.5, c=10)
#'
#' # Density function of x=0.375 when c=100
#' dbradford(x=0.375, c=100)
#' @name bradford
NULL

#' @rdname bradford
#' @export
dbradford <-  function(x, c=5, log=FALSE){
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

#' @rdname bradford
#' @export
pbradford <-  function(q, c=5, lower.tail=TRUE, log.p=FALSE){
  if(c<=0){
    # Prints error
    stop("c parameter must be greater than 0.")
  } else if (any(!dplyr::between(q,0,1))){
    # Also prints error
    stop("q must be between 0 and 1.")
  } else {
    # Calculates probability accordingly

    p <-  log(1+c*q)/log(1+c)

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

#' @rdname bradford
#' @export
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

#' @rdname bradford
#' @export
rbradford <-  function (n, c=5){
  if(c <=0){
    stop("c parameter must be greater than 0.")
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
