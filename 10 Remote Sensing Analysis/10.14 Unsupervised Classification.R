#loading library
library(raster)
library(cluster)
library(randomForest)
library(tmap)

#setting tmap mode to interactive viewing
tmap_mode("view")

#loading data
landsat <- brick("D:/Data/landsat8/stack.tif")
landsat

#plotting
plotRGB(landsat,r=4,g=3,b=2, stretch="lin")

#converting raster data in a matrix and removing NA values
v <- getValues(landsat)
i <- which(!is.na(v))
v <-na.omit(v)

#fist method : k means method
E <- kmeans(v, 12, 100, nstart = 10)
kmeans_raster <- raster(landsat)
kmeans_raster[i] <- E$cluster


# Define a color vector for 10 clusters (learn more about setting the color later)
mycolor <- c("#fef65b","#ff0000", "#daa520","#0000ff","#0000ff","#00ff00","#cbbeb5",
             "#c3ff5b", "#ff7373", "#00ff00", "#808080")

#plotting
plot(kmeans_raster, main="Unsupervised Classified", col=mycolor)
tm_shape(kmeans_raster)+
    tm_raster(palette =  rev(terrain.colors(12)))

#clara classification
clus <- clara(v,12, samples=500, metric="manhattan", pamLike=T)
clara_raster <- raster(landsat)
clara_raster[i] <- clus$clustering
plot(clara_raster)
tm_shape(clara_raster)+
    tm_raster(palette =  rev(terrain.colors(12)))

#unsupervised random forest classification using kmeans
vx <- v[sample(nrow(v),500),]
rf <- randomForest(vx)
rf_prox <-randomForest(vx, ntree=1000, proximity = TRUE)$proximity

E_rf <- kmeans(rf_prox, 12, iter.max = 100, nstart=10)
rf <- randomForest(vx, as.factor(E_rf$cluster), ntree=500)
rf_raster <- predict(landsat, rf)
plot(rf_raster)
tm_shape(rf_raster)+
    tm_raster(palette =  (terrain.colors(12)))
