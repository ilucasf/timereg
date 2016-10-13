\name{pc.hazard}
\alias{pc.hazard}
\title{Simulation of Piecewise constant hazard model (Cox).}
\description{ Simulates data from piecwise constant baseline hazard that can also be of Cox type. Censor data
automatically for highest value of the break points. 
}
\usage{
pc.hazard(cumhazard,rr,cum.hazard=TRUE)
}
\arguments{
  \item{cumhazard}{cumulative hazard, or piece-constant rates for periods defined by first column of input.}
  \item{rr}{number of simulations or vector of relative risk for simuations. }
  \item{cum.hazard}{specifies wheter input is cumulative hazard or rates. }
}
\author{Thomas Scheike}
\examples{
set.seed(1)

rates <-  c(0,0.01,0.052,0.01,0.04)
breaks <- c(0,10,   20,  30,   40)
haz <- cbind(breaks,rates)
n <- 1000
X <- rbinom(n,1,0.5)
beta <- 0.2
rrcox <- exp(X * beta)
cumhaz <- cumsum(c(0,diff(breaks)*rates[-1]))
cumhaz <- cbind(breaks,cumhaz)

pctime <- pc.hazard(haz,1000,cum.hazard=FALSE)

par(mfrow=c(1,2))
ss <- aalen(Surv(time,status)~+1,data=pctime,robust=0)
plot(ss)
lines(cumhaz,col=2,lwd=2)

pctimecox <- pc.hazard(cumhaz,rrcox)
pctime <- cbind(pctime,X)
ssx <- cox.aalen(Surv(time,status)~+prop(X),data=pctimecox,robust=0)
plot(ssx)
lines(cumhaz,col=2,lwd=2)

data(TRACE)

par(mfrow=c(1,2))
ss <- cox.aalen(Surv(time,status==9)~+prop(vf),data=TRACE,robust=0)
par(mfrow=c(1,2))
plot(ss)
###
pctime <- pc.hazard(ss$cum,1000)
###
sss <- aalen(Surv(time,status)~+1,data=pctime,robust=0)
lines(sss$cum,col=2,lwd=2)

pctime <- pc.hazard(ss$cum,rrcox)
pctime <- cbind(pctime,X)
###
sss <- cox.aalen(Surv(time,status)~+prop(X),data=pctime,robust=0)
summary(sss)
plot(ss)
lines(sss$cum,col=3,lwd=3)
}
\keyword{survival}