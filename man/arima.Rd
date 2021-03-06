% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/arima.R
\name{arima}
\alias{arima}
\title{ARIMA Modelling of Time Series}
\usage{
arima(object, ...)
}
\arguments{
\item{object}{FLVector}

\item{order}{A specification of the non-seasonal part of the ARIMA model: 
the three integer components (p, d, q) are the AR order, the degree of differencing,
and the MA order.}
}
\value{
An object of class "FLArima" containing the coefficient and intercept details.
}
\description{
Fit an ARIMA model to a univariate time series.
}
\details{
Different definitions of ARMA models have different signs for the AR and/or MA coefficients. The definition used here has
X[t] = a[1]X[t-1] +…+ a[p]X[t-p] + e[t] + b[1]e[t-1] +…+ b[q]e[t-q]
}
\examples{
x<-rnorm(1000)
flv<-as.FLVector(x)
flobj<-arima(object = flv, order=c(3,0,0))
}
