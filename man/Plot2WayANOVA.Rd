% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Plot2WayANOVA.R
\name{Plot2WayANOVA}
\alias{Plot2WayANOVA}
\title{Plot a 2 Way ANOVA using dplyr and ggplot2}
\usage{
Plot2WayANOVA(formula, dataframe = NULL, confidence=.95, 
    plottype = "bar", PlotSave = FALSE)
}
\arguments{
\item{formula}{a valid R formula with a numeric dependent (outcome)
variable, and two independent (predictor) variables e.g. \code{mpg~am*vs}.
The independent variables are forced to factors (with warning) if possible.}

\item{dataframe}{a dataframe or an object that can be coerced to a dataframe}

\item{confidence}{what confidence level for confidence intervals}

\item{plottype}{bar or line (quoted)}

\item{PlotSave}{a logical indicating whether the user wants to save the plot as a png file}
}
\value{
A list with 4 elements which is returned invisibly. The items are always sent 
to the console for display  The plot is always sent to the default plot device
but for user convenience the function also returns a named list with the following items
in case the user desires to save them or further process them. \code{$ANOVATable}, 
\code{$MeansTable}, \code{$BFTest}, and \code{$SWTest}.
}
\description{
Takes a formula and a dataframe as input, conducts an analysis of variance
using the base R aov command and produces the results (AOV summary table and
table of means) to the console and as a plotted interaction graph (line or
bar) using ggplot2.  Also uses Brown-Forsythe test for homogeneity of
variance.
}
\details{
Details about how the function works in order of steps taken. 
\enumerate{
\item Some basic error checking to ensure a valid formula and dataframe.
Only accepts fully crossed formula to check for interaction term 
\item Ensure the dependent (outcome) variable is numeric and that the two
independent (predictor) variables are or can be coerced to factors -- user
warned on the console 
\item Remove missing cases -- user warned on the console 
\item Use \code{dplyr} to calculate a summarized table of means,
sds, standard errors of the means, confidence intervals, and group sizes.
\item Use the \code{aov} function to execute an Analysis of Variance (ANOVA)
\item Use the \code{\link{neweta}} function to calculate eta squared values.
If the design is unbalanced warn the user and use Type II sums of squares
\item Produce a standard ANOVA table with a column for eta-squared appended
\item Use the \code{leveneTest} for testing Homogeneity of Variance
assumption with Brown-Forsythe 
\item Use the \code{shapiro.test} for testing normality assumption with Shapiro-Wilk 
\item Use \code{ggplot2} to plot an interaction plot of the type the user specified }
}
\examples{

Plot2WayANOVA(mpg~am*cyl, mtcars, plottype = "line")
Plot2WayANOVA(mpg~am*vs, mtcars, confidence = .99)

}
\seealso{
\code{\link[stats]{aov}}, \code{\link[car]{leveneTest}},
\code{\link{neweta}}, \code{\link[stats]{replications}},
\code{\link[stats]{shapiro.test}}
}
\author{
Chuck Powell
}
