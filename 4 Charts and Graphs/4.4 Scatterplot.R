#loading library
library(ggplot2)

#iris dataset is provided natively by R
#head(iris)
head(iris)

#basic scatterplot
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width))+
  geom_point()
