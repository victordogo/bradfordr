
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

# bradfordr <img src='man/figures/logo.png' align="right" height="138" />

[![pkgdown](https://github.com/victordogo/bradfordr/workflows/pkgdown/badge.svg)](https://github.com/victordogo/bradfordr/actions)
[![R-CMD-check](https://github.com/victordogo/bradfordr/workflows/R-CMD-check/badge.svg)](https://github.com/victordogo/bradfordr/actions)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The goal of bradfordr is to implement probability functions from the
Standardized Bradford Distribution in the same way other distributions
are implemented in the `{stats}` package. Its definition and
functionality were taken from
[SciPy](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.bradford.html).

## Definition of the Standardized Bradford Distribution

A continuous random variable follows the Standardized Bradford
Distribution if it’s probability density function is given as the
following:

<a href="https://www.codecogs.com/eqnedit.php?latex=\bg_white&space;\fn_cm&space;\LARGE&space;f(x;c)&space;=&space;\frac{c}{log(1&space;&plus;&space;c)&space;\cdot&space;(1&space;&plus;&space;c&space;\cdot&space;x)}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\bg_white&space;\fn_cm&space;\LARGE&space;f(x;c)&space;=&space;\frac{c}{log(1&space;&plus;&space;c)&space;\cdot&space;(1&space;&plus;&space;c&space;\cdot&space;x)}" title="\LARGE f(x;c) = \frac{c}{log(1 + c) \cdot (1 + c \cdot x)}" /></a>

For 0 &lt;= x &lt;= 1 and c &gt; 0.

It comes primarily from [Bradford’s law of
scattering](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.bradford.html),
which states that, if journals in a specific field are sorted into three
groups (each with one third of all articles of that field), the number
of journals in each group will be proportional to
1 : *n* : *n*<sup>2</sup>. The Bradford Distribution itself is a special
case of the Pareto Distribution, and has some relations with the
Exponential Distribution.

## Installation

You can install the development version of bradfordr from
[GitHub](github.com) with:

``` r
# install.packages("devtools")
devtools::install_github("victordogo/bradfordr")
```

## Example

`{bradfordr}` contains 4 basic functions, exemplified below. More in
depth applications can be seen in the vignettes of this package.

### rbradford

The `rbradford` function generates a vector of values from the
Standardized Bradford Distribution with length `n` and parameter `c`
using the [Inverse Transform Sampling
Method](https://en.wikipedia.org/wiki/Inverse_transform_sampling).

The standard value for `c` is 5:

``` r
library(bradfordr)

rbradford(n=10)
#>  [1] 0.185216959 0.100725128 0.931113765 0.184023942 0.003606418 0.637271882
#>  [7] 0.031869913 0.581854982 0.743135455 0.274802504
```

If the value of c is less or equal than 0, the function returns an error
(this is true to all functions in this package).

### pbradford

The `pbradford` function returns the probabilities calculated from the
accumulated distribution function of the Standardized Bradford
Distribution:

<a href="https://www.codecogs.com/eqnedit.php?latex=\bg_white&space;F(x;&space;c)&space;=&space;P(X&space;\leq&space;x)&space;=&space;\frac{log(1&space;&plus;&space;c&space;\cdot&space;x)}{log(1&plus;c)}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\bg_white&space;F(x;&space;c)&space;=&space;P(X&space;\leq&space;x)&space;=&space;\frac{log(1&space;&plus;&space;c&space;\cdot&space;x)}{log(1&plus;c)}" title="F(x; c) = P(X \leq x) = \frac{log(1 + c \cdot x)}{log(1+c)}" /></a>

If `lower.tail=FALSE`, however, it returns 1 − *F*(*x*; *c*). It also
has the option to return probabilities in the logarithmic scale.

``` r
# Calculating P(X <= 0.7) when c = 10

pbradford(q=0.7,c=10)
#> [1] 0.8671945

# Now, calculating P(X > 0.7) when c = 10

pbradford(q=0.7,c=10, lower.tail=FALSE)
#> [1] 0.1328055
```

### dbradford

The `dbradford` function gives the distribution’s pdf. By definition, we
can’t really calculate probabilities like we do with discrete
distributions (think like *P*(*X* = 10)), so this is the least useful
function in the package.

### qbradford

The `qbradford` function gives the distribution’s quantile function.
It’s useful for discovering what value would satisfy
*P*(*X* ≤ *x*) = *p*. The same arguments from `pbradford` apply here.

``` r
# What value of x satisfies P(X <= x) = 0.8 when c=100?

qbradford(p=0.8, c=100)
#> [1] 0.3912889
```

## Acknowledgments

-   Many thanks to [Prof. Dr. Danilo Lourenço
    Lopes](http://lattes.cnpq.br/8061034473607951), who gave me the
    assignment to create functions for the Standardized Bradford
    Distribution and inadvertently inspired me to create this package;
-   A huge shoutout to all instructors at [curso-r.com](curso-r.com),
    specially [Beatriz Milz](https://github.com/beatrizmilz) and [Caio
    Lente](https://github.com/clente) who taught the R Packages Course.
    It was great!;
-   Also, many thanks to [Athos Damiani](https://github.com/athospd) and
    [Julio Trecenti](https://github.com/jtrecenti) who, in 2019, taught
    a one-time mini course in R in which I’ve helped as event committee
    member (to the best of my abilities at that time, I was very shy).
    They encouraged me a lot! You can see that in [this
    video](https://www.youtube.com/watch?v=Bv_6YeVihZc&t=8068s) (in
    portuguese).

## Meaning of logo

> “I am Wan Shi Tong, he who knows ten thousand things, and you are
> obviously humans; which, by the way, are no longer permitted in my
> study.”

Wan Shi Tong is a wise spirit from the popular acclaimed series “Avatar:
The Last Airbender” and its sequel, “Avatar: The Legend of Korra”. In
both series, its task is to guard and mantain the Spirit Library, in
which almost all knowledge of the world is kept shut from dangerous and
unwanted guests.

Because the Bradford Distribution comes from a law that describes, in a
kind of stretch, *knowledge and its distribution*, I figured that it
would be nice to reference a series I love.
