library(rgdal)
library(spdplyr)
library(sp)
library(leaflet)
library(shiny)
library(shinydashboard)
library(rgeos)
library(rmapshaper)
library(maptools)
library(gtools)
library(raster)

RegionsPolygons <- shapefile("NUTS1.shp")
detach("package:raster", unload = TRUE)
RegionsPolygons <- RegionsPolygons %>% select("objectid", "nuts118nm")
RegionsPolygons <- RegionsPolygons %>% rename(Region = nuts118nm)
RegionsPolygons <- ms_simplify(input = RegionsPolygons, keep = 0.001)

RegionsHousePrices <- read.csv(file ="UK_Region.csv", header = TRUE, sep = ",")

m <- leaflet(RegionsPolygons) %>% 

addPolygons(
  data = RegionsPolygons,
  fillColor = "Black",
  weight = 1, 
  smoothFactor = 0.5,
  dashArray = "1",
  opacity = 1.0, 
  fillOpacity = 1.0
  )

m
