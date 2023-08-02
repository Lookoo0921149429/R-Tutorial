#loading library
library(raster)

#loading data
raslist <- paste0("D:/Data/landsat9/LC09_L2SP_141041_20230412_20230414_02_T1_SR_B",1:7,".TIF")

#stacking
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



#viewing the histogram of the data
hist(ndvi,
     main="Distribution ",
     xlab="NDVI",
     ylab="Frequency",
     col="wheat",
     xlim=c(-0.5,1),
     breaks=30,
     xaxt ='n'
)
axis(side=1, at=seq(-0.5,1,0.05), labels = seq(-0.5,1,0.05))
