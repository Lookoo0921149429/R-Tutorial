#loading library
library(terra)
library(raster)

#loading raster bands
raslist <- paste0("D:/Data/landsat8/LC08_L2SP_023031_20230511_20230518_02_T1_SR_B",1:7,".TIF")

#raster stacking
landsat <- stack(raslist)
landsat

#vegetation indices
vi <- function(img, k, i){
  bk <- img[[k]]
  bi <- img[[i]]
  vi <- (bk-bi)/(bk+bi)
  return(vi)
}

#finding ndvi
ndvi <- vi(landsat,5,4)
plot(ndvi, col=rev(terrain.colors(10)), main="Landsat-NDVI")


#thresholding values less than 0.2
veg <- reclassify(ndvi, cbind(-Inf,0.4, NA))
veg
plot(veg, main="Vegetation")

#thresholding the value between 0.25 and 0.3 
land <- reclassify(ndvi, c(-Inf, 0.25, NA, 0.25, 0.3,1,0.3, Inf, NA))
plot(land)

#plotting FCC and threshold
plotRGB(landsat, r=5,g=3,b=2, stretch="lin")
plotRGB(landsat, r=4,g=3,b=2, stretch="lin")
plot(land, add=TRUE, legend=FALSE)

#creating classes for different amounf of vegetation presence
vegc <- reclassify(ndvi, c(-Inf, 0.25,1, 0.25,0.3,2, 0.3,0.4,3,0.4,0.5,4,0.5,Inf,5))

pal <- palette(c("transparent","orange","yellow","green","darkgreen"))


plot(vegc,col=pal, main="NDVI Based Thresholding")
