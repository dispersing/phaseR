\name{nullclines}
\alias{nullclines}
\title{Nullclines}
\description{Plots nullclines for two dimensional autonomous ODE systems. Or can be used to plot horizontal lines at equilibrium points for one dimensional autonomous ODE systems.}
\usage{nullclines(deriv, x.lim, y.lim, parameters = NULL, points = 101,
                  system = "two.dim", colour = c("red", "blue"), add = TRUE, ...)}
\arguments{
  \item{deriv}{A function computing the derivative at a point for the ODE system to be analysed. Discussion of the required structure of these functions can be found in the package guide.}
  \item{x.lim}{In the case of a two dimensional system, this sets the limits of the first dependent variable in which gradient reflecting line segments should be plotted. In the case of a one dimensional system, this sets the limits of the independent variable in which these line segments should be plotted. Should be a vector of length two.}
  \item{y.lim}{In the case of a two dimensional system this sets the limits of the second dependent variable in which gradient reflecting line segments should be plotted. In the case of a dimensional system, this sets the limits of the dependent variable in which these line segments should be plotted. Should be a vector of length two.}
  \item{parameters}{Parameters of the ODE system, to be passed to deriv. Supplied as a vector; the order of the parameters can be found from the deriv file. Defaults to NULL.}
  \item{points}{Sets the density at which derivatives are computed. points x points derivatives will be computed. Levels of zero gradient are identified using these computations and the function contour. Increasing the value of points improves identification of nullclines, but increases computation time. Defaults to 101.}
  \item{system}{Set to either "one.dim" or "two.dim" to indicate the type of system being analysed. Defaults to "two.dim".}
  \item{colour}{In the case of a two dimensional system, sets the colours used for the x- and y-nullclines. In the case of a one dimensional system, sets the colour of the lines plotted horizontally along the equilibria. Will be reset accordingly if it is a vector of the wrong length. Defaults to c("red", "blue").}
  \item{add}{Logical. If TRUE, the nullclines are added to an existing plot. If FALSE, a new plot is created. Defaults to TRUE.}
  \item{\dots}{Additional arguments to be passed to either plot or contour.}
}
\value{Returns a list with the following components (the exact make up is dependent upon the value of system):
  \item{add}{As per input.}
  \item{colour}{As per input, but with possible editing if a vector of the wrong length was supplied.}
  \item{deriv}{As per input.}
  \item{dx}{A matrix. In the case of a two dimensional system, the values of the derivative of the first dependent derivative at all evaluted points.}
  \item{dy}{A matrix. In the case of a two dimensional system, the values of the derivative of the second dependent variable at all evaluated points. In the case of a one dimensional system, the values of the derivative of the dependent variable at all evaluated points.}
  \item{parameters}{As per input.}
  \item{points}{As per input.}
  \item{system}{As per input.}
  \item{x.lim}{As per input.}
  \item{x}{A vector. In the case of a two dimensional system, the values of the first dependent variable at which the derivatives were computed. In the case of a one dimensional system, the values of the independent variable at which the derivatives were computed.}
  \item{y.lim}{As per input.}
  \item{x}{A vector. In the case of a two dimensional system, the of values of the second dependent variable at which the derivatives were computed. In the case of a one dimensional system, the values of the dependent variable at which the derivatives were computed.}
}
\author{Michael J. Grayling}
\note{In order to ensure a nullclines is plotted, set x.lim and y.lim strictly enclosing its location. For example, to ensure a nullcline is plotted along x = 0, set y.lim to e.g. begin at -1.}
\seealso{\code{\link{contour}}, \code{\link{plot}}}
\examples{# Plot the flow field, nullclines and several trajectories for the one
# dimensional autonomous ODE system logistic.
logistic.flowField  <- flowField(logistic, x.lim = c(0, 5), y.lim = c(-1, 3),
                                 parameters = c(1, 2), points = 21, system = "one.dim",
								 add = FALSE)
logistic.nullclines <- nullclines(logistic, x.lim = c(0, 5), y.lim = c(-1, 3),
                                  parameters = c(1, 2), system = "one.dim")
logistic.trajectory <- trajectory(logistic, y0 = c(-0.5, 0.5, 1.5, 2.5), t.end = 5,
                                  parameters = c(1, 2), system = "one.dim")

# Plot the velocity field, nullclines and several trajectories for the two dimensional
# autonomous ODE system simplePendulum.
simplePendulum.flowField  <- flowField(simplePendulum, x.lim = c(-7, 7),
                                       y.lim = c(-7, 7), parameters = 5, points = 19,
									   add = FALSE)
y0                        <- matrix(c(0, 1, 0, 4, -6, 1, 5, 0.5, 0, -3), ncol = 2,
                                    nrow = 5, byrow = TRUE)
simplePendulum.nullclines <- nullclines(simplePendulum, x.lim = c(-7, 7),
                                        y.lim = c(-7, 7), parameters = 5, points = 500)
simplePendulum.trajectory <- trajectory(simplePendulum, y0 = y0, t.end = 10,
                                        parameters = 5)
}