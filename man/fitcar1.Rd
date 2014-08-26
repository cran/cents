\name{fitcar1}
\alias{fitcar1}

\title{
Fit AR(1) model with censoring and missing values
}
\description{
later
}
\usage{
fitcar1(z, cL = -Inf, cU = Inf, verboseQ = FALSE)
}
\arguments{
  \item{z}{
a time series vector including possible NA values
}
  \item{cL}{
lower censor point
}
  \item{cU}{
upper censor point
}
  \item{verboseQ}{
show iterations
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
A. I. McLeod
}
\note{
later
}


\seealso{
\code{\link{fitar1}}
}
\examples{
 z <- arima.sim(model=list(ar=0.8), n=100)
 z[50] <- NA
 fitcar1(z)
}

\keyword{ ts }
