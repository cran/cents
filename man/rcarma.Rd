\name{rcarma}
\alias{rcarma}

\title{
Simulate censored arma time series
}
\description{
simulated censored time series
}
\usage{
rcarma(n=200, ar=0.9, ma=0.6, mu=100, siga=15, rates=c(0.15, NA), Mrate = 0)
}
\arguments{
  \item{n}{length of series, default 200.
}
  \item{ar}{
ar coefficients
}
  \item{ma}{
ma coefficients
}
  \item{mu}{
mean
}
  \item{siga}{
standard deviation of innovations
}
  \item{rates}{either a vector of length 2 or a matrix with n rows and 2 columns.
  In the vector case, the first element indicates the left-censor rate and the second
  element indicates the right-censor rate. Set to NA is there is no censoring.
  Interval censored data corresponds to setting both a left-censor rate and right-censor rate.
  The default setting indicates a left-censor rate 0.15 with no right censoring.
  The vector case handles single censoring and the matrix case is for multiple
  censor points. In this case each column indicates the corresponding censoring
  for each observation. 
}
  \item{Mrate}{
fraction of missing values. Default is 0.
}
}

\value{
an object of class 'cents' which is a list with three elements. 
First element, 'y', is the censored time series. 
Second element, 'iy', indicates for each observed valued "o", "L", "R", NA
according to whether the value is fully observed, left-censored, right-censored,
or missing.
Third element, 'censorPts', is a matrix with 2 columns indicating the censor point
or NA if no censoring is applicable. 
Note that censorPts does not indicate if the observation was actually censored
since this depends on the unknown latent variable.
An observation is censored if and only if the corresponding entry in iy is
either "L" or "R".  
The component 'censorPts' is useful for plotting. See example below.
}

\examples{
#Default example
out <- rcarma()
plot(out)
}
\keyword{ ts }
