% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/coerce.R
\name{vec_coerce}
\alias{vec_coerce}
\title{Coerce vectors to shared type}
\usage{
vec_coerce(..., .strict = TRUE)
}
\arguments{
\item{...}{Vectors to coerce.}

\item{.strict}{If \code{.strict = FALSE}, there will always be a common type for
any pair of vectors. This will be a character vector for factors with
different level sets, and a list for everything else.}
}
\value{
A list of input vectors coerced to shared (least-upper-bound) type,
or an error stating that a common type could not be found.
}
\description{
This function is a general tool that will be of most interest when developing
new functions, but it also serves as a central place to document design
decisions. See \code{\link[=vec_c]{vec_c()}} for an application of these principles.
}
\section{Coercion rules}{


vctrs thinks of the vector types as forming a partially ordered set, or
poset. Then finding the common type from a set of types is a matter of
finding the least-upper-bound; if the least-upper-bound does not exist,
there is no common type.

The poset of the most important base vectors is shown below:
(where datetime stands for \code{POSIXt}, and date for \code{Date})

\figure{types.png}

Red lines indicate coercions that only occur when \code{.strict = FALSE}
Note that factors are a parametric type; it doesn't make sense to compare
factors with different level sets. The rules are slightly more generous
than shown in this diagram: if one level set is completely contained
within the other, we use the larger set.
}

\examples{

vec_coerce(factor("a"), factor(c("a", "b")))
vec_coerce(factor("a"), factor("b"), .strict = FALSE)

}