# Load the sp package
library(sp)

# Create a data frame with some sample data
df <- data.frame(
  id = c(1, 2, 3),
  name = c("A", "B", "C"),
  value = c(10, 20, 30),
  x = c(0, 1, 2),
  y = c(0, 1, 2)
)

# Create a spatial points object by specifying the data frame, along with the names of the columns
# containing the spatial coordinates
coordinates(df) <- c("x", "y")

# View the resulting sp object
df_sp <- SpatialPoints(df)
df_sp
class(df_sp)
plot(df_sp, axes=TRUE)
