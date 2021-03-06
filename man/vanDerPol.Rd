\name{vanDerPol}
\alias{vanDerPol}
\title{The Van Der Pol Oscillator}
\description{The derivative function of the Van Der Pol Oscillator, an example of a two dimensional autonomous ODE system.}
\usage{vanDerPol(t, y, parameters)}
\arguments{
  \item{t}{Value of t, the independent variable, to evaluate the derivative at. Should be a single number.}
  \item{y}{Values of x and y, the dependent variables, to evaluate the derivative at. Should be a vector of length 2.}
  \item{parameters}{Values of the parameters of the system. Should be a number for the value of mu.}
}
\details{Evaluates the derivative of the following coupled ODE system at the point (t, x, y):

dx/dt = y,   dy/dt = mu*(1 - x^2)*y - x.

Format is designed to be compatible with ode from the deSolve package.}
\value{Returns a list dy containing the values of the two derivatives at (t, x, y).}
\author{Michael J. Grayling}
\seealso{\code{\link{ode}}}
\examples{# Plot the velocity field, nullclines and several trajectories.
vanDerPol.flowField  <- flowField(vanDerPol, x.lim = c(-5, 5), y.lim = c(-5, 5),
                                  parameters = 3, points = 15, add = FALSE)
y0                   <- matrix(c(2, 0, 0, 2, 0.5, 0.5), ncol = 2, nrow = 3, byrow = TRUE)
vanDerPol.nullclines <- nullclines(vanDerPol, x.lim = c(-5, 5), y.lim = c(-5, 5),
                                   parameters = 3, points = 500)
vanDerPol.trajectory <- trajectory(vanDerPol, y0 = y0, t.end = 10, parameters = 3)

# Plot x and y against t.
vanDerPol.numericalSolution <- numericalSolution(vanDerPol, y0 = c(4, 2), t.end = 100,
                                                 parameters = 3)

# Determine the stability of the equilibrium point.
vanDerPol.stability <- stability(vanDerPol, y.star = c(0, 0), parameters = 3)
}