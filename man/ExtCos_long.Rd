% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ExtCos_long.R
\name{ExtCos_long}
\alias{ExtCos_long}
\title{Extended Cosinor Model for Circadian Rhythmicity for Whole Dataset}
\usage{
ExtCos_long(count.data, logtransform = TRUE)
}
\arguments{
\item{count.data}{\code{data.frame} of dimension n*1442 containing the 1440 minute activity data for all n subject days.
The first two columns have to be ID and Day.}

\item{logtransform}{Conduct log transfomation before. Default is \code{TRUE}.}
}
\value{
A \code{data.frame} with following columns
\item{ID}{identifier of the person}
\item{min}{minimum}
\item{amp}{amplitude}
\item{alpha}{alpha parameter}
\item{beta}{beta parameter}
\item{acro}{acrophase}
}
\description{
A parametric approach to study circadian rhythmicity assuming cosinor shape.
Here we used the anti logistic transformed cosine curves, which provided 5 parameters.
This function is a wrapper for \code{ExtCos}.
}
\examples{
data(example_activity_data)
count.data = example_activity_data$count
extcos = ExtCos_long(count.data = count.data, logtransform  = TRUE)


}
