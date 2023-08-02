#show/hide layers in leaflet

#Loading library
library(sf)
library(leaflet)


#reading the shapefile
NUD <- st_read("D:/Data/Nepal_Urea_Data/Nepal_Urea_Data.shp")
road <- st_read("D:/Data/npl-majrdsl-gist/npl_majrdsl_gist.shp")
airport <- st_read("D:/Data/airport/Airports.shp")


#initializing leaflet
leaflet()%>%
  #basegroup
  addTiles(group="OSM(default)")%>% #leaflet::providers
  addProviderTiles(provider ="Esri.WorldTerrain", group = "ESRI W. Terraing" ) %>%
  addProviderTiles(provider = "OpenSeaMap", group = "Open Sea Map")%>%
  #overlay group
  addPolygons(data=NUD,
              color="black",
              weight = 1,
              fillOpacity = 0.3,
              fillColor = "#ffff00",
              group = "Nepal",
  )%>%
#adding line features
  addPolylines(data=road,
               weight = 1,
               color = "red",
               group = "Roads"
  )%>%
#adding markers
  addMarkers(data=airport,
             group="Airport",
             popup = ~NAME)%>%

#layers control
addLayersControl(
  baseGroups = c("OSM(default)","ESRI W. Terraing","Open Sea Map"),
  overlayGroups = c("Airport","Roads","Nepal"),
  options = layersControlOptions(collapsed = TRUE)
)
