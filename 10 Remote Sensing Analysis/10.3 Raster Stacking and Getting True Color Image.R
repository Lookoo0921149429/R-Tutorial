#loading library
library(terra)

#loading data
#blue
b2 <- rast("D:/Data/landsat9/LC09_L2SP_141041_20230412_20230414_02_T1_SR_B2.TIF")

#green
b3 <- rast("D:/Data/landsat9/LC09_L2SP_141041_20230412_20230414_02_T1_SR_B3.TIF")

#red
b4 <- rast("D:/Data/landsat9/LC09_L2SP_141041_20230412_20230414_02_T1_SR_B4.TIF")

#NIR
b5 <- rast("D:/Data/landsat9/LC09_L2SP_141041_20230412_20230414_02_T1_SR_B5.TIF")

#stacking the raster layers
stack <- c(b5,b4,b3)
stack

#plotting the true color image
landsatRGB <- c(b4,b3,b2)
plotRGB(landsatRGB, stretch="hist")

#plotting the false color composite
landsatFCC <- c(b5,b4,b3)
plotRGB(landsatFCC, stretch="hist")
