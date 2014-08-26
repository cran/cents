\name{print.Cenarma}
\alias{print.Cenarma}
\title{
Plot method for "cents" object
}
\description{
print method for cenarma() function
}
\usage{
\method{print}{Cenarma}(x, ...)
}

\arguments{
  \item{x}{
cents object
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
set.seed(321)
n <- 200
z <- arima.sim(model=list(ar=0.8), n) 
i <- sample(1:n, size=floor(0.25*n))
z[i] <- NA
cenarma(y=z, p=1)
}

\keyword{ ts }
