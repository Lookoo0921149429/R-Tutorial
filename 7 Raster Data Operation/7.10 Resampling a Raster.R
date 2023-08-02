library(raster)

#loading raster file
dem <- raster("D:/Data/dem/dem.tif")
dem
res(dem)

#creating new raster from dem file
r <- raster(dem)
res(r)
res(r)<-30
res(r)

#resampling

dem <- resample(dem, r, method="bilinear")
res(dem)
