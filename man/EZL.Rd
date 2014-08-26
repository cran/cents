\name{EZL}
\alias{EZL}
\alias{EZR}

\title{
Expected value in left or right truncated normal distribution
}
\description{
The formula was obtained using Mathematica.
}
\usage{
EZL(zmu, zsig, c)
EZR(zmu, zsig, c)
}
\arguments{
  \item{zmu}{
mean
}
  \item{zsig}{
standard deviation
}
  \item{c}{
detection limit (DL)
}
}

\value{
expected value from a left/right truncated normal
}

\examples{
EZR(100,15,80)
EZL(100,15,105)
}

\keyword{ distribution }
