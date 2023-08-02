#loading library
library(terra)

#loading data
filenames <- paste0("D:/Data/landsat9/LC09_L2SP_141041_20230412_20230414_02_T1_SR_B",1:7,".TIF")
filenames

#raster stacking
landsat <- rast(filenames)
landsat
