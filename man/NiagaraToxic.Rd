\name{NiagaraToxic}
\alias{NiagaraToxic}
\docType{data}
\title{
Successive readings of a toxic substance in the Niagara River near Fort Erie, Ontario.
}
\description{
Niagara River at Fort Erie, successive readings of 12-Dichloro in units of ng/L measured approximately biweekly.
}
\usage{data(NiagaraToxic)}
\format{
  A data frame with 144 observations on the following 4 variables.
  \describe{
    \item{\code{toxic}}{a numeric vector}
    \item{\code{jday}}{a numeric vector}
    \item{\code{cQ}}{a numeric vector}
    \item{\code{cL}}{a numeric vector}
  }
}
\details{
Dr. Abdel El-Shaarwai provided through Environment Canada some a special water quality time series 
that is of great practical interest. The time series is from Station ON02HA0019 (Fort Erie) on the water 
quality of the Niagara River. There are more than 500 water quality parameters or variables of interest 
in this river. The water quality in this river is montiored by a joint U.S./Canada committee. 
One important toxic variable of great interest is a chemical known as 12-Dichloro which when 
dissolved in water is measured in units of ng/L. We use a portion of the recent data on this variable 
that was measured approximately every two weeks over the period from March 1, 2001. 
This period was chosen because it is the most recent period over which we have a time series 
of approximately biweekly observations. The time series plot below plots the Julian day number defined 
so that Julian day number 1 corresponds to the date of the first observation (March 1, 2001). 

In total there are 144 values and the data are left censored. 
The observed censoring rate is r=21/144=14%. 
After  March 24, 2005 the detection level for 12 Dichloro dropped from 0.214 to 0.0878. 
After this change there was only one censored value at Julian day number 1807. 
Before the change in censoring there were 75 complete observations and 20 censored ones 
while from March 24, 2005 to the last observation on March 22, 2007 there were 48 complete observations 
and only one censored observation. 
}

\source{
Dr. Abdel El-Shaarwai, Environment Canada
}
\references{
N. M. Mohammad (2014). Censored time series analysis. Ph.D. Thesis, Western University.
}

\examples{
data(NiagaraToxic)
head(NiagaraToxic)

#Example from thesis
\dontrun{
#Diagnostic checks and bootstrap confidence intervals
Zdf <- NiagaraTmeans <- apply(A, MARGIN=2, fun=mean)oxic
z <- log(Zdf$toxic)
iz <- c("o", "L")[1+Zdf$cQ]
#
#CENARMA(1,1) 
cenarma(z, iz, p=1, q=1)
#fit CENAR(1)
cenarma(z, iz, p=1)
#
#diagnostic checks########
#test CENARMA(1,1)
SimModel <- function(OUTCENARMA){
  outSim <- boot.Cenarma(OUTCENARMA)
}
FitModel <- function(outSim){
  z <- outSim$y
  iz <- outSim$iy
  ans <- cenarma(z, iz, p=1, q=1)
  res <- resid(ans$outarima)
  list(res=res)
}
OUTCENARMA <- cenarma(y=NiagaraToxic$toxic, iy=c("o", "L")[1+NiagaraToxic$cQ], p=1, q=1)
func <- list(SimModel=SimModel, FitModel=FitModel)
start.time <- proc.time()[3]
outp <- portest(OUTCENARMA$outarima, lags=5:25, nslaves=8, NREP=10^3, func=func, test="LjungBox")
total.time <- proc.time()[3]-start.time
total.time
plot(outp[,1], outp[,4], xlab="lag", ylab="P-Value", cex=1.5, col="blue", pch=18, ylim=c(0,1))
abline(col="red", h=0.05)
#
#test CENAR(1)
SimModel <- function(OUTCENARMA){
  boot.Cenarma(OUTCENARMA)
}
FitModel <- function(outSim){
  z <- outSim$y
  iz <- outSim$iy
  ans <- cenarma(z, iz, p=1)
  res <- resid(ans$outarima)
  list(res=res)
}
OUTCENARMA <- cenarma(y=log(NiagaraToxic$toxic), iy=c("o", "L")[1+NiagaraToxic$cQ], p=1)
func <- list(SimModel=SimModel, FitModel=FitModel)
start.time <- proc.time()[3]
outp <- portest(OUTCENARMA$outarima, lags=5:25, nslaves=8, NREP=10^3, func=func, test="LjungBox")
total.time <- proc.time()[3]-start.time
total.time
plot(outp[,1], outp[,4], xlab="lag", ylab="P-Value", cex=1.5, col="blue", pch=18, ylim=c(0,1))
abline(col="red", h=0.05)
#
#bootstrap confidence intervals
#CENARMA(1,1)
OUTCENARMA <- cenarma(y=log(NiagaraToxic$toxic), iy=c("o", "L")[1+NiagaraToxic$cQ], p=1, q=1)
nboot <- 1000 
A <- matrix(numeric(nboot*3), ncol=3)
start.time <- proc.time()[3]
for (iboot in 1:nboot){
  out <- boot.Cenarma(OUTCENARMA)
  A[iboot, ] <- coef(cenarma(y=out$y, iy=out$iy, p=1, q=1)$outarima)
}
total.time <- proc.time()[3]-start.time
total.time
means <- apply(A, MARGIN=2, FUN=mean)
means
LO <- apply(A, MARGIN=2, function(x) quantile(x, 0.025))
HI <- apply(A, MARGIN=2, function(x) quantile(x, 0.975))
ansARMA11 <- matrix(c(LO,HI), nrow=3, dimnames=list(c("phi","theta","mu"), c("lo", "hi")))
#CEAR(1)
OUTCENARMA <- cenarma(y=log(NiagaraToxic$toxic), iy=c("o", "L")[1+NiagaraToxic$cQ], p=1)
nboot <- 1000 
A <- matrix(numeric(nboot*2), ncol=2)
start.time <- proc.time()[3]
for (iboot in 1:nboot){
  out <- boot.Cenarma(OUTCENARMA)
  A[iboot, ] <- coef(cenarma(y=out$y, iy=out$iy, p=1)$outarima)
}
total.time <- proc.time()[3]-start.time
total.time
means <- apply(A, MARGIN=2, FUN=mean)
means
LO <- apply(A, MARGIN=2, function(x) quantile(x, 0.025))
HI <- apply(A, MARGIN=2, function(x) quantile(x, 0.975))
ansAR2 <- matrix(c(LO,HI), nrow=2, dimnames=list(c("phi","mu"), c("lo", "hi")))
#summary
ansARMA11
ansAR2
}
}
\keyword{datasets}
