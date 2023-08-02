#loading library and importing the shapefiles
library(rgdal)
setwd("D:/Data/")
district_wgs84 <- readOGR("District_WGS84/","district")
district_azimuthal<- readOGR("District_Azimuthal/","districts")

#find the crs of the both data
proj4string(district_wgs84)
proj4string(district_azimuthal)

#reprojecting
district_azimuthal_reproj <- spTransform(district_azimuthal, CRS(proj4string(district_wgs84)))

#checking the coordinates
range(coordinates(district_azimuthal))
range(coordinates(district_azimuthal_reproj))

#visually comparing
par(mfrow=c(1,2))
plot(geometry(district_azimuthal), axes=TRUE, main="before projection")
plot(geometry(district_azimuthal_reproj), axes=TRUE, main="after projection")


#saving the reprojected data
writeOGR(district_azimuthal_reproj, "district_azimuthal_reproj","district_reprojected", driver="ESRI Shapefile")
