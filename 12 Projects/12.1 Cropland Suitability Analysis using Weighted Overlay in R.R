library(raster)
library(leaflet)

#setting working directory
setwd("D:/Data/Cropland_Suitability")

#loading the layers
elevation <- raster("elevation.tif")
slope <- raster("slope.tif")
aspect <- raster("aspect.tif")
road <- raster("Road_Proximity.tif")
river <- raster("River_Proximity.tif")
lulc <- raster("LULC.tif")
moisture <- raster("SoilMoisture.tif")

#resampling to have common resolution
elevation <- resample(elevation, moisture, "ngb")
slope <- resample(slope, moisture, "ngb")
aspect <- resample(aspect, moisture, "ngb")
road <- resample(road, moisture, "ngb")
river <- resample(river, moisture, "ngb")
lulc <- resample(lulc, moisture, "ngb")




#displaying data in the leaflet
m <- leaflet()%>%
  addRasterImage(elevation, group = "Elevation")%>%
  addRasterImage(slope, group = "Slope")%>%
  #addRasterImage(aspect, group = "Aspect")%>%
  addRasterImage(road, group = "Road")%>%
  addRasterImage(river, group = "River")%>%
  addRasterImage(lulc, group = "LULC")%>%
  addRasterImage(moisture, group = "Moisture")%>%
  
#adding layer control

addLayersControl(
  overlayGroups = c("Elevation","Slope","Road","River","LULC","Moisture"),
  options = layersControlOptions(collapsed = FALSE)
)
m  

#reclassifying the layers
reclass_elevation <- reclassify(elevation, c(15,150,10, 150,500,8, 500,1000,6, 1000,1500,4, 1500,Inf, 2 ))
reclass_slope <- reclassify(slope, c(0,3,10, 3,10,8, 10,20,6, 20,30,4, 30,89,2))
reclass_soil_moisture <- reclassify(moisture, c(-Inf, 0.15, 1, 0.15,0.20,2, 0.20,0.25,6, 0.25,0.30,8, 0.30,0.45,10))
reclass_river <- reclassify(river, c(0,500,10, 500,1000, 7, 1000,2000,5, 2000,3000,2,3000,4500,1))
reclass_road <- reclassify(road, c(0,500,10, 500,1000,7, 1000,1500,4, 1500,2000,3,2000,2500,1))

m4lulc <- c(1,1 , 45,1 ,131,1 , 140, 10, 178,3 )
rclmat4lulc <- matrix(m4lulc, ncol=2, byrow = TRUE)
reclass_lulc <- reclassify(lulc, rclmat4lulc)

m4aspect <- c(0,22.5,1, 22.5,67.5,3,67.5,112.5,5,112.5,157.5,9,157.5,202.5,9,202.5,247.5,10,247.5,292.5,5,292.5,337.5,3,337.5,360,1)
rclmat4aspect <- matrix(m4aspect, ncol=3, byrow = TRUE)

reclass_aspect <-reclassify(aspect,rclmat4aspect )

#adding to leaflet
m1 <- leaflet()%>%
    addRasterImage(reclass_elevation, group = "R. Elevation")%>%
    addRasterImage(reclass_slope, group = "R. Slope")%>%
    #addRasterImage(reclass_aspect, group = "R. Aspect")%>%
    addRasterImage(reclass_road, group = "R. Road")%>%
    addRasterImage(reclass_river, group = "R. River")%>%
    addRasterImage(reclass_lulc, group = "R. LULC")%>%
    addRasterImage(reclass_soil_moisture, group = "R. Moisture")%>%
    addLayersControl(
        overlayGroups = c("R. Elevation","R. Slope","R. Road","R. River","R. LULC","R. Moisture"),
        options = layersControlOptions(collapsed = FALSE)
    )
m1


#weighted overlay
wght_ovrly <- (0.31*reclass_slope+0.26*reclass_elevation+0.18*reclass_lulc+0.13*reclass_soil_moisture+0.07*reclass_river+0.03*reclass_aspect+0.02*reclass_road)
plot(wght_ovrly)


#finding site suitability area
site <- wght_ovrly*lulc
plot(site)
