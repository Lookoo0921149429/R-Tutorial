#loading library
library(sf)

#setting working directory
setwd("D:/Data/")

#reading data
data <- read.csv("data.csv")
data

#creating the shapefile from data
city <- st_as_sf(data, coords=c("Lat","Long"))
city

#plotting geometry only
plot(city$geometry)

#viewing and changing coordinate reference system
st_crs(city)
st_crs(city) <- 4326
st_crs(city)

#writing the shapefile
st_write(city, "city", driver="ESRI Shapefile")