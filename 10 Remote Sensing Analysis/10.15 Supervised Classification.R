#loading library
library(raster)
library(rpart)

#loading data
data <- brick("D:/Data/landsat8/stack.tif")

#plotting 
plotRGB(data,r=4,g=3,b=2, stretch="hist")

#getting the sample points from the plot
water <- click(data, n=Inf,id=FALSE, xy=TRUE, cell=FALSE, type="n", show=TRUE)
water
water <- data.frame(classValue= "Water", water)
water


builtup <- click(data, n=Inf,id=FALSE, xy=TRUE, cell=FALSE, type="n", show=TRUE)
builtup
builtup <- data.frame(classValue= "Builtup", builtup)
builtup

agriculture <- click(data, n=Inf,id=FALSE, xy=TRUE, cell=FALSE, type="n", show=TRUE)
agriculture
agriculture <- data.frame(classValue= "Agriculture", agriculture)
agriculture

barren <- click(data, n=Inf,id=FALSE, xy=TRUE, cell=FALSE, type="n", show=TRUE)
barren
barren <- data.frame(classValue="Barren", barren)
barren

#aggregating the samples
sampvals <-  rbind(water, builtup, agriculture, barren)
sampvals
sampvals1 <- sampvals[,-2:-3]
sampvals1

#training the classifier
cart <- rpart(as.factor(classValue)~., data=sampvals1, method="class", minsplit=5)

#plotting the trained classification tree
plot(cart, uniform=TRUE, main="Classification True")
text(cart, cex=0.5)

#classifying
pr <- predict(data, cart, type="class")
pr

#plotting classification
mycolor = c("green","yellow","red","blue")
plot(pr, y="ID", col=colors)
