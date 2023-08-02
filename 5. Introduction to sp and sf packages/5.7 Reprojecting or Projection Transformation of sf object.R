#loading a spatial data with sf
#loading library
library(sf)

#setting word directory
setwd("D:/Data/")

#loading shapefile
district_wgs84 <- st_read("District_WGS84/district.shp")
district_azimuthal <- st_read("District_Azimuthal/districts.shp")

#finding the crs of both the layers
st_crs(district_wgs84)
st_crs(district_azimuthal)

#reprojecting azimuthal to wgs84
district_azimuthal_reproj <- st_transform(district_azimuthal, st_crs(district_wgs84))

#comparing the coordinates before and after reprojection
# range() returns the min and max value of a vector of number
range(st_coordinates(district_azimuthal))
range(st_coordinates((district_azimuthal_reproj)))

#comparing visually
par(mfrow=c(1,2))
plot(st_geometry(district_azimuthal), axes=TRUE, main= "before transform")
plot(st_geometry(district_azimuthal_reproj), axes=TRUE, main= "after transform")

#saving the reprojected file 
st_write(district_azimuthal_reproj, "district_reprojected", driver = "ESRI Shapefile")
