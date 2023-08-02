#loading library
library(raster)
library(tmap)

#setting map mode to interactive
tmap_mode("view")

#loading the data
dem <- raster("D:/Data/dem/dem.tif")

#plotting
tm_shape(dem)+
  tm_raster()

#terrain function

#slope
slope <- terrain(dem, opt="slope", unit="radians", neighbours=8)
tm_shape(slope)+
  tm_raster(palette = "-RdYlGn")

#aspect
aspect <- terrain(dem, opt="aspect", unit="radians", neighbours=8)
tm_shape(aspect)+
  tm_raster(palette = "-RdYlGn")


#hillshade
hillshade <- hillShade(slope, aspect, angle=45, direction=115 )
tm_shape(hillshade)+
  tm_raster(palette = grey(0:100/100))
