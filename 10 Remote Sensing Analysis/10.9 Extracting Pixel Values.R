library(terra)
library(sf)

#loading the raster file
r <- rast("D:/Data/landsat9/stack.tif")
r
plotRGB(r, stretch="hist")

#reading the point data
pts <- st_read("D:/Data/landsat9/points/points.shp")
plot(st_geometry(pts), col="red", bringToTop=TRUE, add=TRUE)

#checking crs
crs(r)==crs(pts)
pts <- st_transform(pts, st_crs(r))
crs(r)==crs(pts)

#now plotting
plotRGB(r, stretch="lin")
plot(st_geometry(pts), col="red", width=3, bringToTop=TRUE, add=TRUE)

#extracting
ext_val <- extract(r, pts)
ext_val


