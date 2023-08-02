#loading library
library(sf)

#setting working directory 
setwd("D:/Data/")

#reading shapefile
dang <- st_read("Dang_Local_Level/Dang_Local_Level.shp")
roads <- st_read("npl-majrdsl-gist/npl_majrdsl_gist.shp")

#changing the crs if crs is not same for both
st_crs(dang)
st_crs(roads)

dang_reproj <- st_transform(dang, st_crs(roads))
st_crs(dang_reproj) == st_crs(roads)

#plotting the shapefile
plot(st_geometry(roads))
plot(st_geometry(dang), add=TRUE)

#cropping
dang_roads <- st_crop(st_geometry(roads), st_geometry(dang_reproj), crop=TRUE, collect=TRUE)

plot(st_geometry(dang_roads), col = "red")
plot(st_geometry(dang), add=TRUE)


#buffering
dang_roads_buffer <- st_buffer(dang_roads_intersection, dist = 1500)
plot(st_geometry(dang_roads_buffer), col = "red")

#union
shape1 <- st_read("Geoprocessing/shape1.shp")
shape2 <- st_read("Geoprocessing/shape2.shp")
plot(st_geometry(shape1))
plot(st_geometry(shape2))

sf_use_s2(FALSE)
shp_uni <- st_union(shape1,shape2, by_feature = TRUE, is_coverage = TRUE)

plot(st_geometry(shp_uni))


#intersection
shp_intersect <- st_intersection(shape1, shape2)
plot(shp_intersect$geometry)


#difference
shp_diff <- st_difference(shape2, shape1)
plot(st_geometry(shp_diff))
