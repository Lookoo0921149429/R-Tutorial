# Load the sf package
library(sf)

# Create a data frame with some sample data
df <- data.frame(
  id = c(1, 2, 3),
  name = c("A", "B", "C"),
  value = c(10, 20, 30),
  x = c(0, 1, 2),
  y = c(0, 1, 2)
)

# Create an sf object by specifying the data frame, along with the names of the columns
# containing the spatial coordinates
sf_object <- st_as_sf(df, coords = c("x", "y"))

# View the resulting sf object
sf_object

plot(sf_object$geometry)





# create a matrix with the coordinates of the line
coords <- matrix(c(0,0, 1,1, 2,0), ncol = 2, byrow = TRUE)

# create a linestring object from the coordinates
line <- st_linestring(coords)

# create an sf object from the linestring object
line_sf <- st_sf(geometry = st_sfc(line))

# plot the line using the plot() function
plot(line_sf)



#creating polygons
library(sf)

# create a matrix with the coordinates of the polygon
coords <- matrix(c(0,0, 0,1, 1,1, 1,0, 0,0), ncol = 2, byrow = TRUE)

# create a polygon object from the coordinates
poly <- st_polygon(list(coords))

# create an sf object from the polygon object
poly_sf <- st_sf(geometry = st_sfc(poly))

# plot the polygon using the plot() function
plot(poly_sf)
