#library
library(raster)

#loading data
raslist <- paste0("D:/Data/landsat8/LC08_L2SP_023031_20230511_20230518_02_T1_SR_B",1:7,".TIF")

#stacking the rasters
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


#ndwi = (G-NIR)/(G+NIR)
ndwi <- vi(landsat, 3,5)
plot(ndwi, col=rev(topo.colors(20)), main="Landsat-NDWI")

    

