#loading library
library(sf)
library(tmap)

#loading data
dang <- st_read("D:/Data/dang_pop/dang_pop.shp")

#setting tmap mode to interactive viewing
tmap_mode("view")


#creating simple interactive map
tm_shape(dang)+
    tm_polygons()

#filtering specific field
tm_shape(dang)+
    tm_polygons("Ttl_Fmly")

#adding basemap and tiles
tm_basemap(c("OpenStreetMap","OpenStreetMap.HOT","OpenTopoMap","GeoportailFrance.orthos"))+
tm_shape(dang)+
    tm_polygons("Ttl_Fmly")+
    tm_tiles("Stamen.TonerLabels")
#note we can get available tilemaps by leaflet::providers
    

#some modifications and styles
tm_basemap(c("OpenStreetMap","OpenStreetMap.HOT","OpenTopoMap","GeoportailFrance.orthos"))+
    tm_shape(dang)+
    tm_borders("black")+
    tm_fill("gray40")+
    tm_symbols("Ttl_Fmly", col = "red")+
    tm_tiles("Stamen.TonerLabels")

#creating facet maps
tm_basemap(c("OpenStreetMap","OpenStreetMap.HOT","OpenTopoMap","GeoportailFrance.orthos"))+
    tm_shape(dang)+
    tm_polygons(c("Ttl_Fmly","Ttl_Ppl"))+
    tm_facets(sync=TRUE, ncol=2)

#saving / exporting maps
tm <- tm_basemap(c("OpenStreetMap","OpenStreetMap.HOT","OpenTopoMap","GeoportailFrance.orthos"))+
            tm_shape(dang)+
            tm_polygons("Ttl_Fmly")+
            tm_tiles("Stamen.TonerLabels")+
            tm_layout(title = "Family Count")
tm

#saving as image
setwd("D:/Data/export")
#saving as image (plot-mode)
tmap_save(tm, filename = "dang_map.png" )

#saving as stand-alone HTML file
tmap_save(tm, filename = "dang_map.html")
