library(raster)

#reading the raster file
FilePath <- file.choose()
data <- raster(FilePath)

#simple plotting
plot(data)

#adding axes
#by default axes is TRUE
plot(data, axes=FALSE)

#adding title
plot(data, axes=FALSE, main="Raster Layer")

#custom axes
axis(1, at = c(250000 + 0:3*50000), cex.axis=0.5 )
axis(2, at = c(2940000 + 0:5*50000), cex.axis=0.5 )
box()



#adding raster stack
st <- stack("D:/Data/landsat9/stackData.tif")
st
nlayers(st)
plot(st)
plotRGB(st, r=3, g=2, b=1, stretch="hist")
