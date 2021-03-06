% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/racog.R
\name{racog}
\alias{racog}
\title{Rapidly converging Gibbs algorithm.}
\usage{
racog(dataset, numInstances, burnin = 100, lag = 20, classAttr = "Class")
}
\arguments{
\item{dataset}{\code{data.frame} to treat. All columns, except
\code{classAttr} one, have to be numeric or coercible to numeric.}

\item{numInstances}{Integer. Number of new minority examples to generate.}

\item{burnin}{Integer. It determines how many examples generated for a given
one are going to be discarded firstly. By default, 100.}

\item{lag}{Integer. Number of iterations between new generated example for a
minority one. By default, 20.}

\item{classAttr}{\code{character}. Indicates the class attribute from
\code{dataset}. Must exist in it.}
}
\value{
A \code{data.frame} with the same structure as \code{dataset},
  containing the generated synthetic examples.
}
\description{
Allows you to treat imbalanced discrete numeric datasets by generating
synthetic minority examples, approximating their probability distribution.
}
\details{
Approximates minority distribution using Gibbs Sampler. Dataset must be
discretized and numeric. In each iteration, it builds a new sample using a
Markov chain. It discards first \code{burnin} iterations, and from then on,
each \code{lag} iterations, it validates the example as a new minority
example. It generates \eqn{d (iterations-burnin)/lag} where \eqn{d} is
minority examples number.
}
\examples{
data(iris0)

# Generates new minority examples

newSamples <- racog(iris0, numInstances = 40, burnin = 20, lag = 10,
                    classAttr = "Class")
\donttest{
newSamples <- racog(iris0, numInstances = 100)
}
}
\references{
Das, Barnan; Krishnan, Narayanan C.; Cook, Diane J. Racog and Wracog: Two
Probabilistic Oversampling Techniques. IEEE Transactions on Knowledge and
Data Engineering 27(2015), Nr. 1, p. 222–234.
}
