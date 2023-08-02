library(raster)

#loading raster file
dem <- raster("D:/Data/dem/dem.tif")
dem

stack <- raster("D:/Data/landsat8/stack.tif")
stack

#check crs
st_crs(dem)==st_crs(stack)

#reprojecting
stack <- projectRaster(stack, dem)

st_crs(dem)==st_crs(stack)
