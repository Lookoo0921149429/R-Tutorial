#loading library
library(terra)

#loading files
filenames <- paste0("D:/Data/landsat9/LC09_L2SP_141041_20230412_20230414_02_T1_SR_B",1:7,".TIF")
filenames

#raster stacking
landsat <- rast(filenames)
landsat

#finding spatial extent of landsat 9
e <- ext(landsat)
e

e <- ext(300000,400000,2500000,3000000 )

#cropping
landsatCrop1 <- crop(landsat, e)



#or

library(sf)

extent <- st_read("D:/Data/kathmandu/kathmandu.shp")
crs(extent)==crs(landsat)

#changing crs
extent_reproj <- st_transform(extent, st_crs(landsat))

#cropping
landsatCrop2 <- crop(landsat, extent_reproj)

#plotting all
par(mfrow=c(1,3))
plotRGB(landsat, main="Not Cropped", stretch="hist")
plotRGB(landsatCrop1, main="Cropped One", stretch="hist")
plotRGB(landsatCrop2,main="Cropped Two", stretch="hist")


#saving results to disk 
setwd("D:/Data/export")
writeRaster(landsatCrop1, filename = "cropped-landsat1.tif", overwrite=TRUE)
