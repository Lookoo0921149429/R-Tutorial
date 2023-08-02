#choropleth maps

#loading library
library(sf)
library(leaflet)

#reading shapefile
NUD <- st_read("D:/Data/Nepal_Urea_Data/Nepal_Urea_Data.shp")

#initializing leaflet
m <- leaflet(NUD)%>%addTiles()

m

#adding polygons
m%>%addPolygons()

#adding some colors
#coloring district as per the Urea Consumption
bins <- c(0,100,500,1000,2000,4000,5000,8000,Inf)
pal <- colorBin("Oranges", domain = NUD$Total_Urea, bins = bins)

#adding polygons and setting fill color to palette
m%>%addPolygons(
    fillColor = ~pal(Total_Urea),
    weight = 2,
    opacity = 1,
    color="white",
    dashArray = "3",
    fillOpacity = 1
)

#adding Interaction
m%>%addPolygons(
    fillColor = ~pal(Total_Urea),
    weight = 2,
    opacity = 1,
    color="white",
    dashArray = "3",
    fillOpacity = 1,
    highlightOptions = highlightOptions(
        weight = 3,
        color = "red",
        dashArray = "",
        fillOpacity = 1,
        bringToFront = TRUE
    )
)

#adding custom info
labels <- sprintf(
    "<b>%s</b><br/>%g Metric Ton",
    NUD$FIRST_DIST, NUD$Total_Urea
)%>%lapply(htmltools::HTML)

m%>%addPolygons(
    fillColor = ~pal(Total_Urea),
    weight = 2,
    opacity = 1,
    color="white",
    dashArray = "3",
    fillOpacity = 1,
    highlightOptions = highlightOptions(
        weight = 3,
        color = "red",
        dashArray = "",
        fillOpacity = 1,
        bringToFront = TRUE),
    label=labels,
    labelOptions = labelOptions(
        style = list("font-weight"="normal", padding="3px 8px"),
        textsize = "15px",
        direction = "auto"
    )
)%>%

#adding legend
addLegend(
    pal=pal,
    values = ~Total_Urea,
    opacity = 0.9,
    title = "Urea(Metric Ton)",
    position = "bottomright"
)

m
