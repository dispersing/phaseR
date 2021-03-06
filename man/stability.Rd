\name{stability}
\alias{stability}
\title{Stability Analysis}
\description{Uses stability analysis to classify equilibrium points. Uses the Taylor Series approach (also known as Perturbation Analysis) to classify equilibrium points of a one dimensional autonomous ODE system, or the Jacobian approach to classify equilibrium points of a two dimensional autonomous ODE system. In addition, it can be used to return the Jacobian at any point of a two dimensional system.}
\usage{stability(deriv, y.star = NULL, parameters = NULL, system = "two.dim", h = 1e-7,
                 summary = TRUE)}
\arguments{
  \item{deriv}{A function computing the derivative at a point for the ODE system to be analysed. Discussion of the required structure of these functions can be found in the package guide.}
  \item{y.star}{The point at which to perform stability analysis. For a one variable system this should be a single number, for a two variable system this should be a vector of length two (i.e. presently only one equilibrium points stability can be evaluated at a time). Alternatively this can be left blank and the user can use locator to choose a point to perform the analysis. However, given you are unlikely to locate exactly the equilibrium point, if possible enter y.star yourself. Defaults to NULL.}
  \item{parameters}{Parameters of the ODE system, to be passed to deriv. Supplied as a vector; the order of the parameters can be found from the deriv file. Defaults to NULL.}
  \item{system}{Set to either "one.dim" or "two.dim" to indicate the type of system being analysed. Defaults to "two.dim".}
  \item{h}{Step length used to approximate the derivative(s). Defaults to 1e-7.}
  \item{summary}{Set to either TRUE or FALSE to determine whether a summary of the stability analysis is returned. Defaults to TRUE.}
}
\value{Returns a list with the following components (the exact make up is dependent upon the value of system):
  \item{classification}{The classification of y.star.}
  \item{Delta}{In the two dimensional system case, value of the Jacobians determinant at y.star.}
  \item{deriv}{As per input.}
  \item{discriminant}{In the one dimensional system case, the value of the discriminant used in Perturbation Analysis to assess stability. In the two dimensional system case, the value of T^2 - 4*Delta.}
  \item{eigenvalues}{In the two dimensional system case, the value of the Jacobians eigenvalues at y.star.}
  \item{eigenvectors}{In the two dimensional system case, the value of the Jacobians eigenvectors at y.star.}
  \item{jacobian}{In the two dimensional system case, the Jacobian at y.star.}
  \item{h}{As per input.}
  \item{parameters}{As per input.}
  \item{summary}{As per input.}
  \item{system}{As per input.}
  \item{tr}{In the two dimensional system case, the value of the Jacobians trace at y.star.}
  \item{y.star}{As per input.}
}
\author{Michael J. Grayling}
\examples{# Determine the stability of the equilibrium points of the one dimensional
# autonomous ODE system example2.
example2.stability.1 <- stability(example2, y.star = 0, system = "one.dim")
example2.stability.2 <- stability(example2, y.star = 1, system = "one.dim")
example2.stability.3 <- stability(example2, y.star = 2, system = "one.dim")

# Determine the stability of the equilibrium points of the two dimensional autonomous
# ODE system example11.
example11.stability.1 <- stability(example11, y.star = c(0, 0))
example11.stability.2 <- stability(example11, y.star = c(0, 2))
example11.stability.3 <- stability(example11, y.star = c(1, 1))
example11.stability.4 <- stability(example11, y.star = c(3, 0))
}