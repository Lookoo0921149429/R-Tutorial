#loading library
library(sf)

#creating single line matrix
a_single_line_matrix <-rbind(c(1,2),c(2,4),c(3,3),c(2,1),c(4,2))

#creating a line geometry
a_single_line <- st_linestring(a_single_line_matrix)
a_single_line
attributes(a_single_line)
plot(a_single_line, col="red")


#creating an sfc object
line1 <- st_linestring(rbind(c(1,1), 
                             c(2,4), 
                             c(3,3), 
                             c(4,3), 
                             c(5,2)))

line2 <- st_linestring(rbind(c(3,3), 
                             c(3,5), 
                             c(4,5)))

line3 <- st_linestring(rbind(c(2,4), 
                             c(-1,4), 
                             c(-2,-2)))

lines <- st_sfc(line1,line2,line3,crs=4326)

lines

plot(lines)

#adding attribute data
line_att <- data.frame(road_name = c("Madhyam Path","KI Singh","New Road"),
                       speed_limit = c(30,40,50))
line_att

#attaching geometry to attribute table
lines_sf <- st_sf(line_att, geometry=lines)
lines_sf
plot(lines_sf['speed_limit'])
