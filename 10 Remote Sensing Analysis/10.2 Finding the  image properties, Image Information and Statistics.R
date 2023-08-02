#loading library
library(terra)

#loading data
#blue
b2 <- rast("D:/Data/landsat9/LC09_L2SP_141041_20230412_20230414_02_T1_SR_B2.TIF")

#green
b3 <- rast("D:/Data/landsat9/LC09_L2SP_141041_20230412_20230414_02_T1_SR_B3.TIF")

#red
b4 <- rast("D:/Data/landsat9/LC09_L2SP_141041_20230412_20230414_02_T1_SR_B4.TIF")

#NIR
b5 <- rast("D:/Data/landsat9/LC09_L2SP_141041_20230412_20230414_02_T1_SR_B5.TIF")

#finding image properties
b2

#finding coordinate reference system
crs(b2)

#number of cell, rows, column
ncell(b2)

dim(b2)

#spatial resolution
res(b2)

#number of layers
nlyr(b2)

#checking if the bands have same extent, number of rows and columns
#projection, resolution and origin
compareGeom(b2,b4)

compareGeom(b2,b4,b5)

