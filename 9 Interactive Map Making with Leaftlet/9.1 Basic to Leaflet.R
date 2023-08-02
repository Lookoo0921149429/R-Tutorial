#loading library
library(leaflet)

#introduction
m <- leaflet()%>%
    addTiles()%>%
    addMarkers(lng=83.2745 ,lat=27.4827, popup = "The Birthplace of Buddha")
m

#adding popups
content <- paste(sep = "<br/>",
                 "<b><a href='https://lumbinidevtrust.gov.np/en'>Lumbini</a></b>",
                 "Birth Place of Buddha",
                 "Bhairahawa, Rupandehi"
                 )
content

m <-leaflet()%>%
    addTiles()%>%
    addPopups(lng=83.2745 ,lat=27.4827,content, 
              options = popupOptions((closeButton=FALSE)))
m

