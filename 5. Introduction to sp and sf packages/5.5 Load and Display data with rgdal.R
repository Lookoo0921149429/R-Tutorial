#loading packages
library(rgdal)

#setting working directory
setwd("D:/Data/")

#loading shapefile
district <- readOGR("district/","district")

#finding the class of the variable
class(district)

#plotting and getting the summary
plot(district)
summary(district)

#subsetting the data and plotting
state5 <- subset(district, FIRST_STAT=="5")
state5
plot(state5)
