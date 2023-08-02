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

#plotting with 2 x 2 column
par(mfrow=c(2,2))
plot(b2, main="Blue", col=gray(0:100/100))
plot(b3, main="Green", col=gray(0:100/100))
plot(b4, main="Red", col=gray(0:100/100))
plot(b5, main="NIR", col=gray(0:100/100))

summary(b2)
