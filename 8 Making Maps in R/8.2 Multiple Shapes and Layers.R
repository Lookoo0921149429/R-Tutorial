#loading library
library(sf)
library(tmap)
library(raster)

#loading data
dang <- st_read("D:/Data/tmap/dang.shp")
road <- st_read("D:/Data/tmap/road.shp")
river <- st_read("D:/Data/tmap/river.shp")
points <- st_read("D:/Data/tmap/points.shp")
dem <- raster("D:/Data/tmap/dem.tif")

#setting tmap mode to plotting
tmap_mode("plot")

#plotting the shapefiles
tm_shape(dem)+
    tm_raster(palette = terrain.colors(10))+
    tm_shape(dang)+
    tm_borders("red", lwd=3)+
    tm_shape(points)+
    tm_symbols(size=1, col = "red")+
    tm_shape(road)+
    tm_lines(col = "brown", lwd = 2)+
    tm_shape(river)+
    tm_lines(col="blue",lwd=2)+
    tm_legend(show=FALSE)


