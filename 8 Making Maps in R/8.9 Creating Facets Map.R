#loadinglibrary
library(sf)
library(tmap)

#adding data
NUD <- st_read("D:/Data/Nepal_Urea_Data/Nepal_Urea_Data.shp")
as.matrix(NUD)

#setting tmap mode to plotting
tmap_mode("plot")

#by splitting the spatial data with the 'by' arguments of 'tm_facets'
tm_shape(NUD)+
    tm_polygons("Total_Urea",palette="YlOrBr")+
    tm_facets(by="FIRST_STAT")

#by using the 'tmap_arrange' function
tm1 <- tm_shape(NUD)+tm_polygons("Total_Urea")+tm_legend(show=FALSE)
tm2 <- tm_shape(NUD)+tm_polygons()+tm_symbols(size = "Total_Urea", palette = "YlOrBr" )+tm_legend(show=FALSE)

tmap_arrange(tm1,tm2)
