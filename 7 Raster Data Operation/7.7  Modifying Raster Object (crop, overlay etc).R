#reading the external source raster file
library(sf)
library(raster)
setwd("D:/Data/")

#using File Chooser Dialog Box
FilePath <- file.choose()
data <-raster(FilePath)
data

plot(data, main="Raster Layer from File")


#cropping
extent <- st_read("D:/Data/kathmandu/kathmandu.shp")

#checking crs
st_crs(extent) == st_crs(data)

#reprojecting
extent_reproj <- st_transform(extent, st_crs(data))
st_crs(extent_reproj) == st_crs(data)

data_crop <- crop(data, extent_reproj)
plot(data_crop)

#masking
data_mask <- mask(data, extent_reproj)
plot(data_mask)

#merging
extent2 <- st_read("D:/Data/bhaktapur/bhaktapur.shp")
plot(extent2)
#reprojecting
extent2_reproj <- st_transform(extent2, st_crs(data))
data_mask2 <- mask(data, extent2_reproj)
plot(data_mask2)

m <- merge(data_mask, data_mask2)
plot(m)


#calc
r <- raster(ncol=3, nrow=2)
values(r) <- 1 : ncell(r)
getValues(r)

s <- calc(r, fun=function(x){x[x<4]<- NA; return(x)})
as.matrix(s)


#overlay
t <- overlay(r,s, fun=function(x,y){x^2+y^2})
as.matrix(t)


#reclassify
x <- reclassify(r, c(1,2,1, 2,5,2, 5,6,3))
as.matrix(x)
plot(x)
