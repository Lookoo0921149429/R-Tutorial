#loading library
library(sf)

# a single point with XY coordinates of 1,3 in unspecified coordinate system
a_single_point <- st_point(x=c(1,2))

#st_point() function outputs a simple feature geometry (sfg)
a_single_point
plot(a_single_point)
attributes(a_single_point)

#creating 5 sfg point objects
point1 <- st_point(x=c(1,2))
point2 <- st_point(x=c(2,2))
point3 <- st_point(x=c(3,1))
point4 <- st_point(x=c(4,3))
point5 <- st_point(x=c(1,5))

points <- st_sfc(point1, point2, point3, point4, point5)
#st_sfc() creates a single sfc object to store all the point data
points

#assigning CRS
points_crs <- st_sfc(point1, point2, point3, point4, point5, crs = 4326)
points_crs
attributes(points_crs)

#plotting the data
plot(points_crs, col="red", pch=5)

#adding attributes
#we use st_sf() to create the simple feature, then only it can adds the attribute data
points_attr <- data.frame(name = c("Mango","Banana","Banyan","Mango","Apple"))
points_attr

points_sf <- st_sf(points_attr, geometry=points_crs)
points_sf
plot(points_sf, pch=16)
