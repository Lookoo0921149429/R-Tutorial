#loading library
library(tmap)
library(sf)

#loading data
data <- st_read("D:/Data/dang_pop/dang_pop.shp")

#adding the shape and fill the color
tm_shape(data)+tm_fill()
tm_shape(data)+tm_fill(col = "green")
tm_shape(data)+tm_fill(col = "green", alpha=0.5)

#adding border of the layer
tm_shape(data)+tm_borders()
tm_shape(data)+tm_borders(col="red")
tm_shape(data)+tm_borders(col="red", lwd=2, lty="solid", alpha=0.8)

#adding polygon
tm_shape(data)+
  tm_polygons("PALIKA")+
  tm_legend(show=FALSE)
