#reading the external source raster file

#loading library
library(raster)
setwd("D:/Data/")

#loading the raster data
r <- raster("landsat9/LC09_L2SP_141041_20230412_20230414_02_T1_SR_B1.TIF")
r

#or using File Chooser Dialog Box
FilePath <- file.choose()
data <-raster(FilePath)
data

hasValues(r)

#plotting
plot(r, main="Raster Layer from File")

