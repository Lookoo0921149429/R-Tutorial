#adding shapefile in leaflet map

#loading library
library(sf)
library(leaflet)

#adding shapefiles
NUD <- st_read("D:/Data/Nepal_Urea_Data/Nepal_Urea_Data.shp")
road <- st_read("D:/Data/npl-majrdsl-gist/npl_majrdsl_gist.shp")

#initializing leaflet and adding shapefiles
leaflet()%>%
    addPolygons(data=NUD,
                color="black",
                weight = 1,
                fillOpacity = 0.3,
                fillColor = "#ffff00",
                )%>%
    addPolylines(data=road,
                 weight = 1,
                 color = "red"
                 )
