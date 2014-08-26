\name{fitar1}
\alias{fitar1}

\title{
Exact MLE for mean and AR-parmeter in AR(1)
}
\description{
later
}
\usage{
fitar1(z, meanZeroQ = FALSE)
}

\arguments{
  \item{z}{
time series data vector
}
  \item{meanZeroQ}{
default assumes mean is not zero.
}
}
\details{
later
}
\value{
vector of length 3 with the estimates of mean, ar-parameter and the optimized log-likelihood
}
\references{
later
}
\author{
A.I. McLeod
}
\note{
later
}


\seealso{
\code{\link{ar1est0}}
}

\examples{
 z <- arima.sim(model=list(ar=0.8), n=100)
 fitar1(z)

}

\keyword{ ts }
