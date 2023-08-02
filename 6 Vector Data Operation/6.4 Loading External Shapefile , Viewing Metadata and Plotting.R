#loading library
library(sf)

#loading shapefile
data <- st_read("D:/Data/District_WGS84/district.shp")
data

#converting it into dataframe
data_df <- data.frame(data)
data_df

#getting the summary
summary(data)


#plotting
plot(data['FIRST_STAT'])
