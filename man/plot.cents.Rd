\name{plot.cents}
\alias{plot.cents}
\title{
Plot method for "cents" object
}
\description{
a suitable time series plot
}
\usage{
\method{plot}{cents}(x, y, xlab = "t", ylab = expression(y[t]), marko = TRUE, ...)
}

\arguments{
  \item{x}{
cents object
}
  \item{y}{
is ignored
}
  \item{xlab}{
x-axis label
}
  \item{ylab}{
yaxis label
}
  \item{marko}{
mark each observation
}
  \item{\dots}{
options
}
}

\value{
plot produced
}

\seealso{
\code{\link{rcarma}}, \code{\link{summary}}
}

\examples{
#Default example
out <- rcarma()
plot(out)
#
#Example: Interval censoring and multiple censor points.
#double left-censoring
#first 100, rate 10% and second 100, rate is 5%
#right censoring, 20%
n <- 200
rates <- matrix(c(rep(0.1, 100), rep(0.05, 100), rep(0.2, 200)), ncol=2)
out <- rcarma(n, ar=0.7, ma=0.4, mu=100, siga=15, rates=rates)
summary(out)
plot(out)
}

\keyword{ ts }
