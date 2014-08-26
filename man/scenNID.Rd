\name{scenNID}
\alias{scenNID}

\title{ mle estimation of singly-left-censored data using AS 138}

\description{
mle estimation of mean and standard deviation
}
\usage{
scenNID(y, n, cz, type="L")
}

\arguments{
  \item{y}{
fully observed values, less than n if there is censoring
}
  \item{n}{
sample size
}
  \item{cz}{
detection level
}
  \item{type}{
only left censoring at present
}
}

\value{
mle estimates of mean and sd
}

\references{
M. S. Wolynetz (1979). 
Algorithm AS 138: Maximum Likelihood Estimation from Confined and Censored Normal Data. 
Journal of the Royal Statistical Society. Series C (Applied Statistics), 
Vol. 28, No. 2, pp. 185-195
}

\author{
A. I. McLeod
}

\examples{
n <- 50
cy <- (-1)
z <- rnorm(n)
ind <- z > cy
y <- z[ind]
scenNID(y, n, cy)
}

\keyword{ htest }
\keyword{ models }

