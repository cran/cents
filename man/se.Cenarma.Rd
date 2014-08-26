\name{se.Cenarma}
\alias{se.Cenarma}

\title{
Bootstrap se for Cenarma object
}
\description{
Bootstrap se for Cenarma object
}
\usage{
se.Cenarma(obj, nBoot = 250)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{obj}{
obj is the output produced by cenarma()
}
  \item{nBoot}{
number of bootstrap iterations
}
}

\value{
se
}

\seealso{
\code{\link{cenarma}}, 
\code{\link{boot.Cenarma}}
}

\examples{
#Example takes about 30 seconds
\dontrun{
set.seed(43137)
n <- 200
z <- arima.sim(model=list(ar=0.8), n) 
i <- sample(1:n, size=floor(0.25*n))
z[i] <- NA
ANS <- cenarma(y=z, p=1)
startTime <- proc.time()[3]
se.Cenarma(ANS)
totalTime <- proc.time()[3]-startTime
totalTime
}
}

\keyword{ ts }
