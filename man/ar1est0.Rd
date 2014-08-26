\name{ar1est0}
\alias{ar1est0}
\title{
Exact mle ar-parameter in AR(1) with known mean zero.
}
\description{
An efficient exact algorithm.
}
\usage{
ar1est0(z)
}

\arguments{
  \item{z}{
the time series
}
}
\details{
More details later.
}
\value{
MLE estimate of phi
}
\references{
Zhang, Yu and McLeod (2013)
}
\author{
A. I. McLeod
}
\note{
Modification of the algorithm in the mleur package.
}


\examples{
 z <- arima.sim(model=list(ar=0.8), n=100)
 ar1est0(z)
}

\keyword{ts}
