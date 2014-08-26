\name{cenarma}
\alias{cenarma}
\title{
Censored arma estimation
}
\description{
A quasi-EM algorithm is implemented. The R function arima() is used in the
maximization step. The Durbin-Levinson recursions are used to compute
conditional expectations.
}
\usage{
cenarma(y, iy, p=0, q=0, include.mean = TRUE, verbose = FALSE, 
  MaxIter = 100, ETOL = 1e-05, algorithm = c("exact", "approx"), ...)
}
\arguments{
  \item{y}{ time series as a vector of length n
}
  \item{iy}{indicator with entries: "o","L","R","na". If missing, it is assumed
  there is no censoring and iy entries are set to "o" or "na" according to whether
  the corresponding value in y is numeric or NA.
  }

  \item{p}{ar order
}
  \item{q}{ma order
}

  \item{include.mean}{
Default is to estimate the mean. FALSE means we assume the mean is zero.
}

  \item{verbose}{If true, show successive log-likelihoods
}
  \item{MaxIter}{
  maximum number of iterations
}
  \item{ETOL}{
error tolerance
}

  \item{algorithm}{"exact" uses our tacvfARMA() and approximate uses acfARMA()
}

\item{...}{options passed to arima}
}

\value{
fitted model out is a list:
  \item{Arima }{the output for the function arima()}
  \item{v0}{covariance matrix of the parameters}
  \item{dataSummary }{number of data values in each class}
  \item{exitStatus}{"converged" or "Maxit iterations reached"}

}

\examples{
#Default example
#Example. Left-censoring, 10%
\dontrun{
set.seed(313177)
n <- 500
out <- rcarma(n, ar=0.8, ma=-0.6, mu=100, siga=15, rates=c(0.1, NA))
y <- out$y
iy <- out$iy
ans <- cenarma(y, iy, p=1, q=1)
ans[[1]]
#
#Example ARMA(1,1) with missing values.
#Fit using arima() and cenarma()
#compare final relative likelihood and difference log-likelihoods
set.seed(313177)
n <- 500
out <- rcarma(n, ar=0.8, ma=-0.6, mu=100, siga=15, rates=c(NA, NA), Mrate=0.25)
y <- out$y
iy <- out$iy
(ans0 <- arima(y, order=c(1,0,1)))
(ans1 <- cenarma(y, iy, p=1, q=1))[[1]]
logL0 <- ans0$loglik
betaHat <- coef(ans1[[1]])
arHat <- betaHat[1]
maHat <- betaHat[2]
muHat <- betaHat[3]
ans1B <- arima(y, order=c(1,0,1), fixed=c(arHat,maHat,muHat),transform.pars=FALSE)
logL1 <- ans1B$loglik
RL <- exp(logL1-logL0)
RL
logL1-logL0
}
}

\keyword{ ts }
