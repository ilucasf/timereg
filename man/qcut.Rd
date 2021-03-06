% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/qcut.r
\name{qcut}
\alias{qcut}
\title{Cut a variable}
\usage{
qcut(x, cuts = 4, breaks = NULL, ...)
}
\arguments{
\item{x}{variable to cut}

\item{cuts}{number of groups, 4 gives quartiles}

\item{breaks}{can also give breaks}

\item{...}{other argument for cut function of R}
}
\description{
Calls the cut function to cut variables on data frame.
}
\examples{

data(sTRACE)
gx <- qcut(sTRACE$age)
table(gx)

}
\author{
Thomas Scheike
}
\keyword{survival}
