% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cuba.R
\name{get_cuba_regional_cases}
\alias{get_cuba_regional_cases}
\title{Confirmed COVID cases by Province each day in Cuba}
\usage{
get_cuba_regional_cases()
}
\value{
A data frame of daily COVID cases for Cuba by province, to be further processed by \code{get_regional_data()}.
}
\description{
Fetches and cleans daily confirmed COVID-19 case data at the province level for Cuba
Data available at \url{https://covid19cubadata.github.io/data/covid19-casos.csv}.
}
