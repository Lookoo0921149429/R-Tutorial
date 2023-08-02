#loading library
library(shiny)
library(rgdal)
library(leaflet)
library(sf)
library(colourpicker)

#crating ui
ui <- fluidPage(
  
  titlePanel("Shapefile example"),
  
  sidebarLayout(
    sidebarPanel(
      fileInput("filemap", "", accept=c('.shp','.dbf','.sbn','.sbx','.shx',".prj"), multiple=TRUE),
      
      colourInput(
        "lineColor", "Line Color", "red",
        allowTransparent = TRUE,
        closeOnClick = TRUE),
      colourInput(
        "fillColor", "Fill Color", "red",
        allowTransparent = TRUE,
        closeOnClick = TRUE),
      sliderInput("opacity","Opacity",min = 0,max=1,step=0.1, value=0.5),  
      actionButton("submit","Submit"),
      
    ),
    
    
    mainPanel(
      leafletOutput("mapview"),
      
    )
  )
)

#creating server
server <- function(input, output) {   
  
  shp <- eventReactive(input$submit,{
    shpdf <- input$filemap
    if(is.null(shpdf)){
      return()
    }
    previouswd <- getwd()
    uploaddirectory <- dirname(shpdf$datapath[1])
    setwd(uploaddirectory)
    for(i in 1:nrow(shpdf)){
      file.rename(shpdf$datapath[i], shpdf$name[i])
    }
    setwd(previouswd)
    
    map <- st_read(paste(uploaddirectory, shpdf$name[grep(pattern="*.shp$", shpdf$name)], sep="/"))#,  delete_null_obj=TRUE)
    map <- st_transform(map, CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"))
    
    
    leaflet()%>%
      addProviderTiles(provider = providers$OpenStreetMap,
                       options = providerTileOptions(noWrap=TRUE))%>%
      addPolygons(
        data=map, 
        fillColor = input$fillColor, 
        color = input$lineColor, 
        fillOpacity = input$opacity )
  })
  
  output$mapview <- renderLeaflet({
    shp()
  })
  
}

#running app
shinyApp(ui = ui, server = server)

