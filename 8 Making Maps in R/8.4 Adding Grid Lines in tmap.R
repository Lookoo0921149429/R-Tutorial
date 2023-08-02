#loading library
library(tmap)
library(sf)

#loading data
dang <- st_read("D:/Data/District_WGS84/district.shp")
as.matrix(dang)

#plotting shapefile with grid
tm_shape(dang)+
  tm_polygons("FIRST_STAT")+
  tm_legend(show=FALSE)+
  tm_graticules(
    x=NA,
    y=NA,
    n.x=7, #a pretty sequence is used, so the number of actual labels may be different than n.x
    n.y=5,
    labels.show = TRUE,
    labels.size =0.5,
  )



