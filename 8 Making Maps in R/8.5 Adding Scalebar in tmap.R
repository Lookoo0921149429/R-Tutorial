#loading library
library(tmap)
library(sf)

#loading data
dang <- st_read("D:/Data/District_WGS84/district.shp")
as.matrix(dang)

#plotting shape
tm_shape(dang)+
  tm_polygons("FIRST_STAT")+
  tm_legend(show=FALSE)+
    #adding compass
  tm_compass(
    north = 0,
    type="4star",
    size = 1,
    show.labels = 2,
    cardinal.directions = c("North","East","South","East"),
    text.color = "red",
    lwd=0.2,
    position = c("right","top"),
    
  )+
    #adding scalebar
    tm_scale_bar(
    breaks = c(0,5,10,15),
    text.color = "red",
    lwd=1,
    position = c("left","bottom"),
    text.size = 1
  )



