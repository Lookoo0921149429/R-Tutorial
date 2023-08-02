#adding raster images
library(raster)
library(leaflet)

#creating a file chooser dialog box
FilePath <- file.choose()
r<-raster(FilePath)

#initializing the leaflet and adding the raster image
leaflet()%>%
    addTiles()%>%
    addRasterImage(r,
                   colors =  terrain.colors(10))


#what if raster file is too large
FilePath <- file.choose()
r<-raster(FilePath)

#creating a new raster
rs <- raster(r)

#changing resolution
res(rs)<- 300
res(rs)

#resampling the raster
r <- resample(r, rs, method="ngb")
r

#initializing and adding raster image
leaflet()%>%
    addTiles()%>%
    addRasterImage(r,
                   colors =  terrain.colors(10))

