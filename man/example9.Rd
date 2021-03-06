\name{example9}
\alias{example9}
\title{Example ODE System Number Nine}
\description{The derivative function of an example two dimensional autonomous ODE system.}
\usage{example9(t, y, parameters)}
\arguments{
  \item{t}{Value of t, the independent variable, to evaluate the derivative at. Should be a single number.}
  \item{y}{Values of x and y, the dependent variables, to evaluate the derivative at. Should be a vector of length 2.}
  \item{parameters}{Values of the parameters of the system. Not required here.}
}
\details{Evaluates the derivative of the following coupled ODE system at the point (t, x, y):

dx/dt = -2*x + 3*y,   dy/dt = 7*x + 6*y.

Format is designed to be compatible with ode from the deSolve package.}
\value{Returns a list dy containing the values of the two derivatives at (t, x, y).}
\author{Michael J. Grayling}
\seealso{\code{\link{ode}}}
\examples{# Plot the velocity field, nullclines and several trajectories.
example9.flowField  <- flowField(example9, x.lim = c(-3, 3), y.lim = c(-3, 3),
                                 points = 19, add = FALSE)
y0                  <- matrix(c(1, 0, -3, 2, 2, -2, -2, -2), ncol = 2, nrow = 4,
                              byrow = TRUE)
example9.nullclines <- nullclines(example9, x.lim = c(-3, 3), y.lim = c(-3, 3))
example9.trajectory <- trajectory(example9, y0 = y0, t.end = 10)

# Determine the stability of the equilibrium point.
example9.stability <- stability(example9, y.star = c(0, 0))
}