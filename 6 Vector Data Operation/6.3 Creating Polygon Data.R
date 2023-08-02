#loading library
library(sf)

#creating matrix of line string with same first and last points
a_polygon_vertex_matrix <- rbind(c(1,1),
                                 c(2,4),
                                 c(2,5),
                                 c(5,3),
                                 c(1,1))
a_polygon_list = list(a_polygon_vertex_matrix)
a_polygon_list


#creating a simple feature geometry
polygon_sfg <- st_polygon(a_polygon_list)
plot(polygon_sfg, col="forestgreen")


#creating sf object with multiple polygons, attribute info and defined crs
poly1<- polygon_sfg
poly2 <- st_polygon(list(
  rbind(
    c(6,6),c(8,7),c(11,9), c(10,6),c(8,5),c(6,6)
  )
))

poly_att <- data.frame(park_name =c("tribhuwan park","lakhan park"))

poly_sfc <- st_sfc(poly1, poly2, crs=4326)

poly_sfc

poly_sf <- st_sf(poly_att, geometry= poly_sfc)
plot(poly_sf)
