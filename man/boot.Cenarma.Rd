\name{boot.Cenarma}
\alias{boot.Cenarma}
\title{
parametric bootstrap for Cenarma object
}
\description{
Simulates a time series from the model fit by cenarma() and
produces an object of class 'cents'.
}
\usage{
boot.Cenarma(obj, ...)
}

\arguments{
  \item{obj}{
the output from cenarma()
}
  \item{\dots}{
optional arguments, not used
}
}

\value{
Simulated time series as a cents object
}


\seealso{
\code{\link{cenarma}},
\code{\link{rcarma}},
\code{\link{plot.cents}}
}
\examples{
set.seed(43137)
n <- 200
z <- arima.sim(model=list(ar=0.8), n) 
i <- sample(1:n, size=floor(0.25*n))
z[i] <- NA
ANS <- cenarma(y=z, p=1)
out <- boot.Cenarma(ANS)
cenarma(out$y, p=1)
}

\keyword{ ts }
