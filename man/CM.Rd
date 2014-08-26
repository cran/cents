\name{CM}
\alias{CM}

\title{
Censored mean and standard deviation in normal samples
}
\description{
An exact algorithm is used.
}
\usage{
CM(y, iy)
}

\arguments{
  \item{y}{data vector}
  \item{iy}{indicator with entries: "o","L","R","na". If missing, it is assumed
  there is no censoring and iy entries are set to "o" or "na" according to whether
  the corresponding value in y is numeric or NA.}
}

\details{
More details later.
}

\value{
a list
}

\references{
later
}

\author{
A. I. McLeod
}

\seealso{
\code{\link{cenarma}}
}

\examples{
z <- log(NiagaraToxic$toxic)
iz <- c("o", "L")[1+NiagaraToxic$cQ]
CM(z,iz)
cenarma(z, iz, p=0, q=0)
}

\keyword{ models }
\keyword{ htest }
