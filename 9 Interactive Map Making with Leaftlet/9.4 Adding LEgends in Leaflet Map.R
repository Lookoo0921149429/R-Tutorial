#loading library
library(sf)
library(leaflet)

#laoding data
NUD <- st_read("D:/Data/Nepal_Urea_Data/Nepal_Urea_Data.shp")

#creating palette on the basis of Urea Data
pal <- colorNumeric(
    palette = "Oranges",
    domain = NUD$Total_Urea
)

#creating color palette using colorQuantile Function
qpal <- colorQuantile("Oranges",NUD$Total_Urea, n=5)

qpal

#intializing and adding polygon
m <- leaflet(NUD)%>%
    addTiles()%>%
    addPolygons(
        stroke = TRUE,
        color = "red",
        weight = 1,
        fillColor =   ~qpal(Total_Urea),
        fillOpacity = 1,
    )%>%
    #adding legends
    addLegend(
        "bottomright",
        pal = qpal,
        values = ~Total_Urea,
        title = "Urea Consmp."
    )
m
