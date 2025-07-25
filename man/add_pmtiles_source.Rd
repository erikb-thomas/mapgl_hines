% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sources.R
\name{add_pmtiles_source}
\alias{add_pmtiles_source}
\title{Add a PMTiles source to a Mapbox GL or Maplibre GL map}
\usage{
add_pmtiles_source(map, id, url, ...)
}
\arguments{
\item{map}{A map object created by the \code{mapboxgl} or \code{maplibre} function.}

\item{id}{A unique ID for the source.}

\item{url}{A URL pointing to the PMTiles archive.}

\item{...}{Additional arguments to be passed to the JavaScript addSource method.}
}
\value{
The modified map object with the new source added.
}
\description{
Add a PMTiles source to a Mapbox GL or Maplibre GL map
}
\examples{
\dontrun{

# Visualize the Overture Maps places data as PMTiles
# Works with either `maplibre()` or `mapboxgl()`

library(mapgl)

maplibre(style = maptiler_style("basic", variant = "dark")) |>
  set_projection("globe") |>
  add_pmtiles_source(
    id = "places-source",
    url = "https://overturemaps-tiles-us-west-2-beta.s3.amazonaws.com/2025-06-25/places.pmtiles"
  ) |>
  add_circle_layer(
    id = "places-layer",
    source = "places-source",
    source_layer = "place",
    circle_color = "cyan",
    circle_opacity = 0.7,
    circle_radius = 4,
    tooltip = concat(
      "Name: ",
      get_column("@name"),
      "<br>Confidence: ",
      number_format(get_column("confidence"), maximum_fraction_digits = 2)
    )
  )
}
}
