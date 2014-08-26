\name{summary.cents}
\alias{summary.cents}
\title{
Summary method for 'cents'
}
\description{
The summary indicates the number of observed time series values in each of the
classes: "o", "L", "R", or NA.
}
\usage{
\method{summary}{cents}(object, ...)
}
\arguments{
  \item{object}{
cents object that is produced by rcarma()
}
  \item{\dots}{
additional paramaters (ignored)
}
}



\seealso{
\code{\link{rcarma}}
}

\examples{
out <- rcarma()
plot(out)
}

\keyword{ ts }
