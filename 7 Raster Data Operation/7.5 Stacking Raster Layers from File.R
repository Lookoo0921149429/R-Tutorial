library(raster)
setwd("D:/Data/")

#reading the raster layers
b2 <- raster("landsat9/LC09_L2SP_141041_20230412_20230414_02_T1_SR_B2.TIF")

b3 <-  raster("landsat9/LC09_L2SP_141041_20230412_20230414_02_T1_SR_B3.TIF")

b4 <-  raster("landsat9/LC09_L2SP_141041_20230412_20230414_02_T1_SR_B4.TIF")

#raster stacking
s <- stack(b4,b3,b2)

#finding the number of layers
nlayers(b2)
nlayers(s)

#plotting
plotRGB(s, r=3,g=2,b=1, stretch="hist")

#saving the raster file
writeRaster(s, filename="landsat9/stack.tif", format="GTiff")

