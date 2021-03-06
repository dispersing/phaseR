\name{example4}
\alias{example4}
\title{Example ODE System Number Four}
\description{The derivative function of an example two dimensional autonomous ODE system.}
\usage{example4(t, y, parameters)}
\arguments{
  \item{t}{Value of t, the independent variable, to evaluate the derivative at. Should be a single number.}
  \item{y}{Values of x and y, the dependent variables, to evaluate the derivative at. Should be a vector of length 2.}
  \item{parameters}{Values of the parameters of the system. Not required here.}
}
\details{Evaluates the derivatives of the following coupled ODE system at the point (t, x, y):

dx/dt = -x,   dy/dt = 4*x.

Format is designed to be compatible with ode from the deSolve package.}
\value{Returns a list dy containing the values of the two derivatives at (t, x, y).}
\author{Michael J. Grayling}
\seealso{\code{\link{ode}}}
\examples{# Plot the velocity field, nullclines and several trajectories.
example4.flowField  <- flowField(example4, x.lim = c(-3, 3), y.lim = c(-5, 5),
                                 points = 19, add = FALSE)
y0                  <- matrix(c(1, 0, -1, 0, 2, 2, -2, 2, 3, -4, -3, -4), ncol = 2,
                              nrow = 6, byrow = TRUE)
example4.nullclines <- nullclines(example4, x.lim = c(-3, 3), y.lim = c(-5, 5))
example4.trajectory <- trajectory(example4, y0 = y0, t.end = 10)
}