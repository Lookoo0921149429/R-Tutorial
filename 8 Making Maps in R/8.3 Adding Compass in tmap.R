#loading the library
library(tmap)
library(sf)

#loading data
dang <- st_read("D:/Data/dang_popn/dang_popn.shp")
as.matrix(dang)

#plotting with compass
tm_shape(dang)+
  tm_polygons("Ttl_Ppl")+
  tm_legend(show=FALSE)+
  tm_compass(
    north = 0,
    type="4star",
    size = 1,
    show.labels = 2,
    cardinal.directions = c("North","East","South","East"),
    text.color = "red",
    lwd=0.2,
    position = c("right","top"),
    
  )

