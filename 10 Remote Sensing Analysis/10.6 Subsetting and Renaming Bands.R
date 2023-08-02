#loading library
library(terra)

#loading data
filenames <- paste0("D:/Data/landsat9/LC09_L2SP_141041_20230412_20230414_02_T1_SR_B",1:7,".TIF")
filenames

#raster stacking
landsat <- rast(filenames)
landsat

#subsetting bands
landsatsub1 <- subset(landsat, 2:4)
landsatsub1

#or
landsatsub2 <- landsat[[2:4]]
landsatsub2

#checking number of layers
nlyr(landsatsub1)

nlyr(landsatsub2)

#renaming bands
names(landsatsub2)
names(landsatsub2) <- c("blue","green","red")
names(landsatsub2)
