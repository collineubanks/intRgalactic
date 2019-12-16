\name{bootstrap.trendfilter}
\alias{bootstrap.trendfilter}
\title{bootstrap.trendfilter}
\usage{
bootstrap.trendfilter(
  x,
  y,
  lambda.opt,
  sigma = NULL,
  B = 1000,
  x.eval.grid = x,
  k = 2,
  bootstrap.method = "nonparametric",
  alpha = 0.05,
  return.full.ensemble = F
)
}
\arguments{
\item{x}{The observed inputs.}
\item{y}{The observed outputs.}
\item{lambda.opt}{The optimally-tuned trend filtering hyperparameter, e.g. by cross validation on minimizing SURE.}
\item{sigma}{A vector of measurement standard errors of the observed y's.}
\item{B}{The number of boostrap samples used to compute the confidence bands.}
\item{x.eval.grid}{Input evaluation grid. Defaults to the observed inputs.}
\item{k}{The degree of the trend filtering estimator. Defaults to k=2 (quadratic trend filtering).}
\item{bootstrap.method}{Bootstrap method to be implemented. See description for suggested use. Defaults to "nonparametric".}
\item{alpha}{Specifies the width of the 1-alpha pointwise confidence bands.}
\item{return.full.ensemble}{Return the full bootstrap ensemble as an (n x B) matrix. Defaults to FALSE.}
}

\value{
A list with the following elements:
\item{bootstrap.lower.perc.intervals}{Vector of lower bounds for the 1-alpha pointwise confidence band.}
\item{bootstrap.upper.perc.intervals}{Vector of upper bounds for the 1-alpha pointwise confidence band.}
\item{tf.boot.ensemble}{The full bootstrap ensemble as an (n x B) matrix.}
}
\description{
bootstrap.trendfilter takes data of the form (x_1,y_1), ...,(x_n,y_n) or (x_1,y_1,sigma_1), ...,(x_n,y_n,sigma_n) and implements one of three bootstrap algorithms. The bootstrap method should generally be chosen according to the following criteria: 
S1. The inputs are irregularly sampled --> bootstrap.method = "nonparametric";
S2. The inputs are regularly sampled and the noise distribution is known --> bootstrap.method = "parametric";
S3. The inputs are regularly sampled and the noise distribution is unknown --> bootstrap.method = "wild".
}
\examples{
install.packages("devtools")
devtools::install_github("statsmaths/glmgen", subdir="R_pkg/glmgen")
install.packages("dplyr")
}