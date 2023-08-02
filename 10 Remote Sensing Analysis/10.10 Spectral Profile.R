#loading library
library(raster)
library(sf)
library(ggplot2)

theme_set(theme_minimal())

#loading different bands
b1 <- raster("D:/Data/spectralprofiles/l1b1.tif")
b2 <- raster("D:/Data/spectralprofiles/l1b2.tif")
b3 <- raster("D:/Data/spectralprofiles/l1b3.tif")
b4 <- raster("D:/Data/spectralprofiles/l1b4.tif")
b5 <- raster("D:/Data/spectralprofiles/l1b5.tif")
b6 <- raster("D:/Data/spectralprofiles/l1b6.tif")
b7 <- raster("D:/Data/spectralprofiles/l1b7.tif")

#function for converting DN values to TOA Reflectance
reflect<- function(a){
    b <- 0.0000275*a-0.2
    return(b)
}

#converting to TOA reflectance
b1 <- reflect(b1)
b2 <- reflect(b2)
b3 <- reflect(b3)
b4 <- reflect(b4)
b5 <- reflect(b5)
b6 <- reflect(b6)
b7 <- reflect(b7)



#loading the raster file
data <- stack(b1,b2,b3,b4,b5,b6,b7)
data

names(data) <- c('ultra-blue','blue','green','red','NIR','SWIR1','SWIR2')
plotRGB(data,r=4,g=3,b=2, stretch="hist")

#loading the sample point data
sample <- st_read("D:/Data/spectralprofiles/Sample.shp")
plot(sample, col="red", add=TRUE)
head(sample)

#extracting the values
df <- extract(data, sample)
head(df)

#binding the class value
ms <- aggregate(df, list(sample$Category), mean)
ms

rownames(ms)
rownames(ms) <- ms[,1]
ms
ms <- ms[,-1]

ms
rownames(ms)
ms



#now plotting mean spectra of these features

#creating a vector of color to use in plotting
mycolor <- c('green', 'red', 'black', 'blue')

#transform ms from data.frame to a matrix
ms <- as.matrix(ms)



#ggplot
df <- data.frame(t(ms))
ggplot(data=df, aes(x=c(1,2,3,4,5,6,7)))+
    geom_line(aes(y=Agriculture, color="Agriculture"))+
    geom_line(aes(y=Buildings, color="Buildings"))+
    geom_line(aes(y=Road, color="Road"))+
    geom_line(aes(y=Water, color="Water"))+
    xlab("Bands")+
    ylab("Reflectance")+
    ggtitle("Spectral Profile from Landsat 8")+
    scale_color_manual(name="Land Class",
                       breaks = c("Agriculture","Buildings","Road","Water"),
                       values = c("darkgreen","darkred","black","blue"))


