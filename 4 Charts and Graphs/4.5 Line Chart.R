#loading library
library(ggplot2)

head(iris)

#plotting line chart
ggplot(iris, aes(x=Sepal.Length, y= Sepal.Width))+
  geom_line()

#customizing line chart
ggplot(iris, aes(x=Sepal.Length, y= Sepal.Width))+
  geom_line(color="#69b3a2", size=1, alpha=0.9, linetype=1)+
  ggtitle("Sepal Length vs Sepal Width")

