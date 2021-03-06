\name{simplePendulum}
\alias{simplePendulum}
\title{The Simple Pendulum}
\description{The derivative function of the Simple Pendulum, an example of a two dimensional autonomous ODE system.}
\usage{simplePendulum(t, y, parameters)}
\arguments{
  \item{t}{Value of t, the independent variable, to evaluate the derivative at. Should be a single number.}
  \item{y}{Values of x and y, the dependent variables, to evaluate the derivative at. Should be a vector of length 2.}
  \item{parameters}{Values of the parameters of the system. Should be a number for the value of alpha. g is automatically entered as 9.81.}
}
\details{Evaluates the derivative of the following coupled ODE system at the point (t, x, y):

dx/dt = y,   dy/dt = -g*sin(x)/l.

Format is designed to be compatible with ode from the deSolve package.}
\value{Returns a list dy containing the values of the two derivatives at (t, x, y).}
\author{Michael J. Grayling}
\seealso{\code{\link{ode}}}
\examples{# Plot the velocity field, nullclines and several trajectories.
simplePendulum.flowField  <- flowField(simplePendulum, x.lim = c(-7, 7),
                                       y.lim = c(-7, 7), parameters = 5, points = 19,
									   add = FALSE)
y0                        <- matrix(c(0, 1, 0, 4, -6, 1, 5, 0.5, 0, -3), ncol = 2,
                                    nrow = 5, byrow = TRUE)
simplePendulum.nullclines <- nullclines(simplePendulum, x.lim = c(-7, 7),
                                        y.lim = c(-7, 7), parameters = 5, points = 500)
simplePendulum.trajectory <- trajectory(simplePendulum, y0 = y0, t.end = 10,
                                        parameters = 5)

# Determine the stability of two of the equilibrium points.
simplePendulum.stability.1 <- stability(simplePendulum, y.star = c(0, 0),
                                        parameters = 5)
simplePendulum.stability.2 <- stability(simplePendulum, y.star = c(pi, 0),
                                        parameters = 5)
}