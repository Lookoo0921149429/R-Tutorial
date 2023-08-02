#loading library
library(raster)
library(tmap)
tmap_mode('view')

#loading data
b4 <- raster("D:/Data/sisdol/l1b4.tif")
b5 <- raster("D:/Data/sisdol/l1b5.tif")
b10 <- raster("D:/Data/sisdol/l1b10.tif")

#calculation of TOA (Top of Atmospheric) spectral radiance
TOA <- 0.0003342*b10+0.1-0.29

#TAO to Brightness Temperature Conversion
#BT <- (1321.0789/(log(774.8853/TAO)+1))-273.15

BT <- 1321.0789/(log((774.8853/TOA)+1))
BT <- BT - 273.15

#calculating ndvi
ndvi <- (b5-b4)/(b5+b4)
ndvi
plot(ndvi, colors= terrain.colors(10))

#calculating fractional vegetation
ndvi_min <- minValue(ndvi)
ndvi_min
ndvi_max <- maxValue(ndvi)
ndvi_max


fv <- ((ndvi-abs(ndvi_min)/(abs(ndvi_max)-abs(ndvi_min))))^2
#fv <- ((ndvi-0.2)/(0.5-0.2))^2

#emissivity
a = 0.004
b = 0.986
EM = a*fv+b

#calculating land surface temperature
LST <- (BT/(1+(0.00115*BT/1.4388)*log(EM)))



writeRaster(LST,"LST.tif", overwrite=TRUE)
#plotting LST
mycolor = c("green","yellow","brown","red")
plot(LST, palette=mycolor)

tm_basemap('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}')+
tm_shape(LST)+tm_raster(palette = mycolor)

LSTmin <- minValue(LST)
LSTmin
LSTmax <- maxValue(LST)
LSTmax








