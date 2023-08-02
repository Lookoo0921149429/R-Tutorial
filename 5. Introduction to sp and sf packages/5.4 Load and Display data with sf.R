#loading library
library(sf)

#setting working directory
setwd("D:/Data/district/")

#reading data
district <- st_read("district.shp")

#plotting shapefile
plot(district)

#plotting only geometry
plot(st_geometry(district))
district

#subsetting 
state7 <- subset(district, FIRST_STAT=="7")
state7
plot(st_geometry(state7))
