\name{tacvfARMA}
\alias{tacvfARMA}
\title{
Computes TACVF
}
\description{
Computes TACVF
}

\usage{
tacvfARMA(phi = numeric(0), theta = numeric(0), maxlag = 20, useCt = TRUE, sigma2 = 1)
}

\arguments{
  \item{phi}{
AR parameter vector
}
  \item{theta}{
MA parameter vector
}
  \item{maxlag}{
computes at lags 0,1,...,maglag
}
  \item{useCt}{
default is to use C interface otherwise use R source
}
  \item{sigma2}{
innovation variance
}
}

\details{
See McLeod
Why better
}

\value{
vector of length maxlag+1 containing autocovariances at lags 0 to maxlag
}

\references{
McLeod (1975)
}
\author{
A. I. McLeod
}


\seealso{
\code{\link{ARMAacf}}
}
\examples{
2+2
}
\keyword{ ts }
