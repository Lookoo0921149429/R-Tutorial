#loading library
library(sf)
library(tmap)
library(gifski)

#loading data
NUD <- st_read("D:/Data/Nepal_Urea_Data/Nepal_Urea_Data.shp")
as.matrix(NUD)


#by splitting the spatial data with the 'by' arguments of 'tm_facets'
m1 <-tm_shape(NUD)+
  tm_polygons("Total_Urea",palette="YlOrBr")+
  tm_facets(along = "FIRST_STAT")+
  tm_legend(show=TRUE)
  

m1

#creating animated map
tmap_animation(m1, width = 500, delay=100)

#displaying animation map
tmap_animation()
